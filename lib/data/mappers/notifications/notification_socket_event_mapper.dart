import 'package:chat_pet/data/mappers/messages/message_mapper.dart';
import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';

NotificationSocketEvent? notificationSocketEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'friend_request':
      final id = json['id'];
      final sender = json['sender'];
      if (id is! String || sender is! Map<String, dynamic>) return null;

      return FriendRequestNSEvent(
        id: id,
        sender: UserDto.fromJson(sender).toDomain(),
        createdAt: DateTime.tryParse(json['created_at'] as String? ?? ''),
      );

    case 'new_message':
      return NewMessageNSEvent(MessageDto.fromJson(json).toDomain());

    case 'message_edited':
      final id = json['id'];
      final chatId = json['chat_id'];
      final content = json['content'];
      if (id is! String || chatId is! String || content is! String) return null;

      return MessageEditedNSEvent(
        id: id,
        chatId: chatId,
        content: content,
        editedAt: DateTime.tryParse(json['edited_at'] as String? ?? ''),
        isEdited: json['is_edited'] as bool? ?? true,
      );

    case 'last_message_changed':
      final chatId = json['chat_id'];
      if (chatId is! String) return null;

      final lastMessage = json['last_message'];

      return LastMessageChangedNSEvent(
        chatId: chatId,
        lastMessage: lastMessage is Map<String, dynamic> ? MessageDto.fromJson(lastMessage).toDomain() : null,
      );

    default:
      talk.warning('Dont parse notification event, unknown type: ${json['type']}');
      return null;
  }
}
