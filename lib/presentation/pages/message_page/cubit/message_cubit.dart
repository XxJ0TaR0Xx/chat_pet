import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/usecases/chats/chat_web_socket_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/disconnect_from_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/get_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/send_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/update_message_use_case.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

const _firstPageKey = '';

@injectable
class MessageCubit extends Cubit<MessageState> {
  MessageCubit(
    this._getMessagesUseCase,
    this._deleteMessageUseCase,
    this._deleteMessagesUseCase,
    this._updateMessageUseCase,
    this._chatWebSocketUseCase,
    this._disconnectFromChatUseCase,
    this._sendMessageUseCase, {
    required this.chatId,
    required this.currentUserId,
  }) : super(const MessageState.initial()) {
    pagingController = PagingController<String, MessageModel>(
      getNextPageKey: _getNextPageKey,
      fetchPage: _fetchPage,
    );
    _connectChatWebSocket();
  }

  final String chatId;
  final String currentUserId;
  final GetMessagesUseCase _getMessagesUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final DeleteMessagesUseCase _deleteMessagesUseCase;
  final UpdateMessageUseCase _updateMessageUseCase;
  final ChatWebSocketUseCase _chatWebSocketUseCase;
  final DisconnectFromChatUseCase _disconnectFromChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  late final PagingController<String, MessageModel> pagingController;
  StreamSubscription<ChatSocketEvent>? _wsSubscription;

  String? _nextCursor;

  String? _getNextPageKey(PagingState<String, MessageModel> state) {
    if (state.keys == null || state.keys!.isEmpty) return _firstPageKey;
    return _nextCursor;
  }

  Future<List<MessageModel>> _fetchPage(String pageKey) async {
    final cursor = pageKey == _firstPageKey ? null : pageKey;
    final result = await _getMessagesUseCase.call(chatId: chatId, cursor: cursor);

    return result.fold(
      (failure) => throw Exception(failure.localize(S.current)),
      (response) {
        _nextCursor = response.cursor;
        return response.items.map(_withMessageType).toList();
      },
    );
  }

  void _connectChatWebSocket() {
    _wsSubscription = _chatWebSocketUseCase.call(chatId: chatId).listen(_handleSocketEvent);

    talk.verbose('New listener ChatWebSocket subscribed');
  }

  void _handleSocketEvent(ChatSocketEvent event) {
    switch (event) {
      case IncomingMessageEvent(:final message):
        _handleIncomingMessage(message);
      case MessageDeletedEvent(:final messageId):
        _handleDeleteMessage(messageId);
      case MessageEditedEvent(:final messageId, :final content):
        _handelUpdateMessage(messageId, content);
    }
  }

  void _handleIncomingMessage(MessageModel message) {
    final pages = pagingController.pages;
    if (pages == null || pages.isEmpty) return;
    if (pagingController.items!.any((m) => m.id == message.id)) return;

    final mapped = _withMessageType(message);

    pagingController.value = pagingController.value.copyWith(
      pages: [
        [mapped, ...pages.first],
        ...pages.skip(1),
      ],
    );
  }

  void _handleDeleteMessage(String messageId) {
    if (messageId.isEmpty) return;

    pagingController.value = pagingController.value.filterItems((message) => message.id != messageId);
  }

  void _handelUpdateMessage(String messageId, String updatedContent) {
    if (messageId.isEmpty || updatedContent.isEmpty) return;

    pagingController.value = pagingController.value.mapItems(
      (message) => message.id == messageId
          ? message.copyWith(
              content: updatedContent,
              isEditing: true,
            )
          : message,
    );
  }

  MessageModel _withMessageType(MessageModel message) =>
      message.copyWith(messageSender: message.senderId == currentUserId ? MessageSender.me : MessageSender.another);

  Future<void> updateMessage(String newContent, String messageId) async {
    final items = pagingController.items ?? const [];
    final messageModel = items.firstWhere((message) => message.id == messageId);
    await _updateMessageUseCase.call(
      messageModel: messageModel.copyWith(content: newContent),
      chatId: chatId,
      messageId: messageId,
    );
  }

  Future<void> deleteMessage(String messageId, bool forEveryone) async {
    await _deleteMessageUseCase.call(
      chatId: chatId,
      messageId: messageId,
      forEveryone: forEveryone,
    );
  }

  Future<void> deleteMessages(List<String> messageIds, bool forEveryone) async {
    final result = await _deleteMessagesUseCase.call(
      chatId: chatId,
      messageIds: messageIds,
      forEveryone: forEveryone,
    );

    //TODO WS
    result.fold(
      (failure) => emit(_Error(failure.localize(S.current))),
      (_) => pagingController.value = pagingController.value.filterItems((message) => !messageIds.contains(message.id)),
    );
  }

  void sendMessage({required String content, ContentType contentType = ContentType.text}) {
    _sendMessageUseCase.call(chaId: chatId, content: content, contentType: contentType);
  }

  @override
  Future<void> close() {
    _wsSubscription?.cancel();
    _disconnectFromChatUseCase.call();
    pagingController.dispose();
    return super.close();
  }
}
