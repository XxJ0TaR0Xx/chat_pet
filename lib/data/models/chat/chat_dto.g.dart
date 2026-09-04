// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) => _ChatDto(
  id: json['id'] as String,
  members: (json['members'] as List<dynamic>)
      .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  isGroup: json['is_group'] as bool,
  name: json['name'] as String?,
  createAt: json['create_at'] == null
      ? null
      : DateTime.parse(json['create_at'] as String),
  displayName: json['display_name'] as String?,
  avatarUrl: json['display_avatar_url'] as String?,
  lastMessage: json['last_message'] == null
      ? null
      : MessageDto.fromJson(json['last_message'] as Map<String, dynamic>),
  uncheckedMessageCount: (json['uncheckedMessageCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChatDtoToJson(_ChatDto instance) => <String, dynamic>{
  'id': instance.id,
  'members': instance.members,
  'is_group': instance.isGroup,
  'name': instance.name,
  'create_at': instance.createAt?.toIso8601String(),
  'display_name': instance.displayName,
  'display_avatar_url': instance.avatarUrl,
  'last_message': instance.lastMessage,
  'uncheckedMessageCount': instance.uncheckedMessageCount,
};
