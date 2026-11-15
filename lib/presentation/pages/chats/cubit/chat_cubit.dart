import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/interfaces/notifications/notification_repository.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';
import 'package:chat_pet/domain/usecases/chats/create_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/get_chats_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/watch_chat_messages_use_case.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/incoming_chat_message.dart';
import 'package:chat_pet/presentation/utils/chat_session/open_chat_tracker.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getChatsUseCase,
    this._createChatUseCase,
    this._deleteChatUseCase,
    this._notificationRepository,
    WatchChatMessagesUseCase watchChatMessages,
    this._openChatTracker,
  ) : super(const ChatState.initial()) {
    _listenNotifications();
    _messagesSubscription = watchChatMessages().listen((message) => _handleMessage(message, notifyIncoming: false));
    unawaited(getChats());
  }

  final GetChatsUseCase _getChatsUseCase;
  final CreateChatUseCase _createChatUseCase;
  final DeleteChatUseCase _deleteChatUseCase;

  final NotificationRepository _notificationRepository;
  StreamSubscription<NotificationSocketEvent>? _notificationsSubscription;
  StreamSubscription<MessageModel>? _messagesSubscription;
  final OpenChatTracker _openChatTracker;
  final _pendingMessages = <({MessageModel message, bool notifyIncoming})>[];
  int _loadGeneration = 0;

  final List<ChatModel> _cacheChats = List.empty(growable: true);

  final _incomingMessageController = StreamController<IncomingChatMessage>.broadcast();

  /// One-off эффект "пришло новое сообщение" — для баннера-уведомления.
  /// Не путать с [ChatState]: это стрим разовых событий, а не снепшот списка.
  Stream<IncomingChatMessage> get incomingMessages => _incomingMessageController.stream;

  Future<void> getChats() async {
    if (isClosed) return;
    final generation = ++_loadGeneration;
    emit(const ChatState.loading());

    final result = await _getChatsUseCase.call();
    if (isClosed || generation != _loadGeneration) return;

    result.fold(
      (failure) {
        _pendingMessages.clear();
        emit(ChatState.error(failure.localize(S.current)));
      },
      (result) {
        _cacheChats.clear();
        _cacheChats.addAll(result);
        for (final pending in _pendingMessages) {
          _updateLastMessageInChat(pending.message, notifyIncoming: pending.notifyIncoming);
        }
        _pendingMessages.clear();

        emit(ChatState.loaded(List.of(_cacheChats)));
      },
    );
  }

  Future<ChatModel?> createChat(String friendId) async {
    final result = await _createChatUseCase(membersIds: [friendId]);
    if (isClosed) return null;

    ChatModel? chatModel;

    result.fold(
      (failure) => emit(ChatState.error(failure.localize(S.current))),
      (chat) {
        _cacheChats.insert(0, chat);
        emit(ChatState.loaded(List.of(_cacheChats)));
        chatModel = chat;
      },
    );

    return chatModel;
  }

  void clearUncheckedMessageCount(String chatId) {
    final index = _cacheChats.indexWhere((chat) => chat.id == chatId);
    if (index == -1) return;
    _cacheChats[index] = _cacheChats[index].copyWith(unreadCount: 0);

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
  }

  void _listenNotifications() {
    _notificationsSubscription = _notificationRepository.events.listen(_handleNotification);
  }

  void _handleNotification(NotificationSocketEvent event) {
    if (isClosed) return;
    switch (event) {
      case NewMessageNSEvent(:final message):
        _handleMessage(message, notifyIncoming: true);
      case MessageEditedNSEvent(:final id, :final chatId, :final content):
        _applyEditedMessage(chatId: chatId, messageId: id, content: content);
      case LastMessageChangedNSEvent(:final chatId, :final lastMessage, :final unreadCount):
        _applyLastMessageChanged(chatId: chatId, lastMessage: lastMessage, unreadCount: unreadCount);
      case FriendRequestNSEvent():
        break;
    }
  }

  void _handleMessage(MessageModel message, {required bool notifyIncoming}) {
    if (isClosed) return;
    if (state is ChatStateLoading) {
      _pendingMessages.add((message: message, notifyIncoming: notifyIncoming));
      return;
    }
    _updateLastMessageInChat(message, notifyIncoming: notifyIncoming);
  }

  void _updateLastMessageInChat(MessageModel messageModel, {required bool notifyIncoming}) {
    final index = _cacheChats.indexWhere((chat) => chat.id == messageModel.chatId);
    if (index == -1) return;
    if (_cacheChats[index].lastMessage?.id == messageModel.id) return;
    final previousMessage = _cacheChats[index].lastMessage;
    if (previousMessage != null && previousMessage.createAt.isAfter(messageModel.createAt)) return;

    int draftUnreadCount = _cacheChats[index].unreadCount;
    final chatIsOpen = _openChatTracker.openChatId.value == messageModel.chatId;

    if (notifyIncoming && !chatIsOpen) draftUnreadCount++;

    final updatedChat = _cacheChats
        .removeAt(index)
        .copyWith(
          lastMessage: messageModel,
          unreadCount: draftUnreadCount,
        );
    _cacheChats.insert(0, updatedChat);

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
    if (notifyIncoming && !chatIsOpen) {
      _incomingMessageController.add(IncomingChatMessage(chat: updatedChat, message: messageModel));
    }
  }

  void _applyEditedMessage({required String chatId, required String messageId, required String content}) {
    final index = _cacheChats.indexWhere((chat) => chat.id == chatId);
    if (index == -1) return;
    if (_cacheChats[index].lastMessage?.id != messageId) return;

    _cacheChats[index] = _cacheChats[index].copyWith(
      lastMessage: _cacheChats[index].lastMessage?.copyWith(content: content),
    );

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
  }

  void _applyLastMessageChanged({
    required String chatId,
    required MessageModel? lastMessage,
    required int unreadCount,
  }) {
    final index = _cacheChats.indexWhere((chat) => chat.id == chatId);
    if (index == -1) return;

    _cacheChats[index] = _cacheChats[index].copyWith(
      lastMessage: lastMessage,
      unreadCount: unreadCount,
    );

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
  }

  @override
  Future<void> close() async {
    await super.close();
    await _notificationsSubscription?.cancel();
    await _messagesSubscription?.cancel();
    _pendingMessages.clear();
    await _incomingMessageController.close();
  }
}
