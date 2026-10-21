// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMemberDto _$ChatMemberDtoFromJson(Map<String, dynamic> json) =>
    _ChatMemberDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      lastReadAt: json['lastReadAt'] == null
          ? null
          : DateTime.parse(json['lastReadAt'] as String),
    );

Map<String, dynamic> _$ChatMemberDtoToJson(_ChatMemberDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'lastReadAt': instance.lastReadAt?.toIso8601String(),
    };
