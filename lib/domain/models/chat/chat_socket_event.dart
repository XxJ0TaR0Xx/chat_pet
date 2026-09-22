import 'package:chat_pet/domain/models/messages/message_model.dart';

sealed class ChatSocketEvent {
  const ChatSocketEvent();
}

final class IncomingMessageEvent extends ChatSocketEvent {
  const IncomingMessageEvent(this.message);
  final MessageModel message;
}

final class MessageDeletedEvent extends ChatSocketEvent {
  const MessageDeletedEvent(this.messageId);
  final String messageId;
}

final class MessageEditedEvent extends ChatSocketEvent {
  const MessageEditedEvent({required this.messageId, required this.content});
  final String messageId;
  final String content;
}

final class ChatReadEvent extends ChatSocketEvent {
  const ChatReadEvent({
    required this.userId,
    required this.readAt,
  });

  final String userId;
  final DateTime readAt;
}
