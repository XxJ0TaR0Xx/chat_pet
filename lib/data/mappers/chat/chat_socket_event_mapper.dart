import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/data/mappers/messages/message_mapper.dart';
import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';

ChatSocketEvent? chatSocketEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'message':
      return IncomingMessageEvent(MessageDto.fromJson(json).toDomain());

    case 'message_deleted':
      final id = json['id'];
      return id is String ? MessageDeletedEvent(id) : null;

    case 'message_edited':
      final id = json['id'];
      final content = json['content'];
      return (id is String && content is String) ? MessageEditedEvent(messageId: id, content: content) : null;

    default:
      talk.warning('Dont parse chat event st: ${StackTrace.current}');
      return null;
  }
}
