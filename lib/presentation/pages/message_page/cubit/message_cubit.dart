import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/chat/chat_member_model.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/reply_to_message_model.dart';
import 'package:chat_pet/domain/usecases/chats/chat_web_socket_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/disconnect_from_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/get_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/read_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/send_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/update_message_use_case.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:flutter/widgets.dart';
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
    this._sendMessageUseCase,
    this._readMessagesUseCase, {
    required this.chatId,
    required this.currentUserId,
    required List<ChatMemberModel> otherMembers,
  }) : otherMembers = ValueNotifier(otherMembers),
       super(const MessageState.initial()) {
    pagingController = PagingController<String, MessageModel>(
      getNextPageKey: _getNextPageKey,
      fetchPage: _fetchPage,
    );
    _connectChatWebSocket();
    _readMessagesUseCase.call(chatId);
  }

  final String chatId;
  final String currentUserId;

  /// Все участники чата, кроме текущего пользователя.
  /// Для 1-на-1 чата это всегда один элемент — собеседник.
  final ValueNotifier<List<ChatMemberModel>> otherMembers;

  final GetMessagesUseCase _getMessagesUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final DeleteMessagesUseCase _deleteMessagesUseCase;
  final UpdateMessageUseCase _updateMessageUseCase;
  final ChatWebSocketUseCase _chatWebSocketUseCase;
  final DisconnectFromChatUseCase _disconnectFromChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final ReadMessagesUseCase _readMessagesUseCase;

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
      case MessagesDeletedEvent(:final messagesIds):
        _handleDeleteMessages(messagesIds);
      case MessageEditedEvent(:final messageId, :final content):
        _handelUpdateMessage(messageId, content);
      case ChatReadEvent(:final userId, :final readAt):
        _handelChatRead(userId, readAt);
    }
  }

  void _handelChatRead(String userId, DateTime readAt) {
    final members = otherMembers.value;

    final index = members.indexWhere((m) => m.id == userId);
    if (index == -1) return;
    final current = members[index].lastReadAt;
    if (current != null && !readAt.isAfter(current)) return;

    final updated = List<ChatMemberModel>.of(members)..[index] = members[index].copyWith(lastReadAt: readAt);
    otherMembers.value = updated;
  }

  MessageReadStatus readStatusFor(MessageModel message) {
    if (message.messageSender != MessageSender.me) return MessageReadStatus.sent;

    final members = otherMembers.value;
    final isRead = members.isNotEmpty && members.every((m) => m.lastReadAt != null && !m.lastReadAt!.isBefore(message.createAt));

    return isRead ? MessageReadStatus.read : MessageReadStatus.sent;
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

    if (message.senderId != currentUserId) {
      _readMessagesUseCase.call(chatId);
    }
  }

  void _handleDeleteMessage(String messageId) {
    if (messageId.isEmpty) return;

    _removeMessages({messageId});
  }

  void _handleDeleteMessages(List<String> messagesIds) {
    if (messagesIds.isEmpty) return;

    _removeMessages(messagesIds.toSet());
  }

  /// Удаляет сообщения из ленты и помечает удалёнными цитаты, которые на них ссылались.
  void _removeMessages(Set<String> ids) {
    pagingController.value = pagingController.value.filterItems((message) => !ids.contains(message.id)).mapItems((message) {
      final reply = message.replyTo;
      if (reply == null || reply is DeletedReplyTo || !ids.contains(reply.id)) return message;

      return message.copyWith(replyTo: ReplyToMessageModel.deleted(id: reply.id));
    });
  }

  void _handelUpdateMessage(String messageId, String updatedContent) {
    if (messageId.isEmpty || updatedContent.isEmpty) return;

    pagingController.value = pagingController.value.mapItems((message) {
      if (message.id == messageId) {
        return message.copyWith(content: updatedContent, isEditing: true);
      }

      if (message.replyTo case final AvailableReplyTo reply when reply.id == messageId) {
        return message.copyWith(replyTo: reply.copyWith(content: updatedContent));
      }

      return message;
    });
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
    await _deleteMessagesUseCase.call(
      chatId: chatId,
      messageIds: messageIds,
      forEveryone: forEveryone,
    );
  }

  void sendMessage({required String content, ContentType contentType = ContentType.text, String? replyToId}) {
    _sendMessageUseCase.call(
      chaId: chatId,
      content: content,
      contentType: contentType,
      replyToId: replyToId,
    );
  }

  @override
  Future<void> close() {
    _wsSubscription?.cancel();
    _disconnectFromChatUseCase.call();
    pagingController.dispose();
    otherMembers.dispose();
    return super.close();
  }
}
