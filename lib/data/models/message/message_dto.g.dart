// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => _MessageDto(
  id: json['id'] as String,
  chatId: json['chat_id'] as String,
  senderId: json['sender_id'] as String,
  contentType: $enumDecode(_$ContentTypeEnumMap, json['content_type']),
  createAt: DateTime.parse(json['created_at'] as String),
  content: json['content'] as String,
  isEditing: json['is_edited'] as bool? ?? false,
  replyTo: json['reply_to'] == null
      ? null
      : ReplyToMessageDto.fromJson(json['reply_to'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sender_id': instance.senderId,
      'content_type': _$ContentTypeEnumMap[instance.contentType]!,
      'created_at': instance.createAt.toIso8601String(),
      'content': instance.content,
      'is_edited': instance.isEditing,
      'reply_to': instance.replyTo,
    };

const _$ContentTypeEnumMap = {
  ContentType.text: 'text',
  ContentType.image: 'image',
  ContentType.video: 'video',
  ContentType.audio: 'audio',
};
