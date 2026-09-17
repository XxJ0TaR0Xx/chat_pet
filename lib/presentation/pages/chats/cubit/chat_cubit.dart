import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/data/common/services/web_socket/web_socket_service.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/usecases/chats/create_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/get_chats_use_case.dart';
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
    this._notificationSocket,
  ) : super(const ChatState.initial()) {
    getChats();
    _connectChatWebSocket();
  }

  final GetChatsUseCase _getChatsUseCase;
  final CreateChatUseCase _createChatUseCase;
  final DeleteChatUseCase _deleteChatUseCase;

  final NotificationWebSocket _notificationSocket;
  StreamSubscription<Map<String, dynamic>>? _wsSubscription;

  final List<ChatModel> _cacheChats = List.empty(growable: true);

  Future<void> getChats() async {
    emit(const ChatState.loading());

    final result = await _getChatsUseCase.call();
    await Future.delayed(const Duration(seconds: 5));

    result.fold(
      (failure) => emit(ChatState.error(failure.localize(S.current))),
      (result) {
        _cacheChats.clear();
        _cacheChats.addAll(result);

        emit(ChatState.loaded(List.of(_cacheChats)));
      },
    );
  }

  Future<ChatModel?> createChat(String friendId) async {
    final result = await _createChatUseCase(membersIds: [friendId]);

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
    _cacheChats[index] = _cacheChats[index].copyWith(uncheckedMessageCount: 0);

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
  }

  void _connectChatWebSocket() {
    _wsSubscription = _notificationSocket.stream.listen((event) {
      if (event['type'] != 'new_message') return;
      log('connectChatWebSocket ${event}');
      // _updateLastMessageInChat(_parseMessageUseCase());
    });
  }

  void _updateLastMessageInChat(MessageModel messageModel) {
    if (messageModel.chatId.isEmpty) return;

    final index = _cacheChats.indexWhere((chat) => chat.id == messageModel.chatId);
    if (index == -1) return;
    if (_cacheChats[index].lastMessage?.id == messageModel.id) return;

    _cacheChats[index] = _cacheChats[index].copyWith(
      lastMessage: messageModel,
      uncheckedMessageCount: _cacheChats[index].uncheckedMessageCount + 1,
    );

    if (state is ChatStateLoaded) emit(ChatState.loaded(List.of(_cacheChats)));
  }

  @override
  Future<void> close() {
    _wsSubscription?.cancel();
    return super.close();
  }
}
