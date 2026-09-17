import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';

sealed class NotificationSocketEvent {
  const NotificationSocketEvent();
}

final class FriendRequestNSEvent extends NotificationSocketEvent {
  const FriendRequestNSEvent({
    required this.id,
    required this.sender,
    required this.createdAt,
  });

  final String id;
  final UserModel sender;
  final DateTime? createdAt;
}

final class NewMessageNSEvent extends NotificationSocketEvent {
  const NewMessageNSEvent(this.message);

  final MessageModel message;
}

final class MessageEditedNSEvent extends NotificationSocketEvent {
  const MessageEditedNSEvent({
    required this.id,
    required this.chatId,
    required this.content,
    required this.editedAt,
    this.isEdited = true,
  });

  final String id;
  final String chatId;
  final String content;
  final DateTime? editedAt;
  final bool isEdited;
}

final class LastMessageChangedNSEvent extends NotificationSocketEvent {
  const LastMessageChangedNSEvent({
    required this.chatId,
    this.lastMessage,
  });

  final String chatId;

  /// null означает, что в чате не осталось сообщений (последнее было удалено/скрыто).
  final MessageModel? lastMessage;
}
