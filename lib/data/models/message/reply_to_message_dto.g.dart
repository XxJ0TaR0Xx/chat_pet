// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_to_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReplyToMessageDto _$ReplyToMessageDtoFromJson(Map<String, dynamic> json) =>
    _ReplyToMessageDto(
      id: json['id'] as String,
      senderId: json['sender_id'] as String?,
      content: json['content'] as String?,
      contentType: $enumDecodeNullable(
        _$ContentTypeEnumMap,
        json['content_type'],
      ),
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ReplyToMessageDtoToJson(_ReplyToMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'content': instance.content,
      'content_type': _$ContentTypeEnumMap[instance.contentType],
      'deleted': instance.deleted,
    };

const _$ContentTypeEnumMap = {
  ContentType.text: 'text',
  ContentType.image: 'image',
  ContentType.video: 'video',
  ContentType.audio: 'audio',
};
