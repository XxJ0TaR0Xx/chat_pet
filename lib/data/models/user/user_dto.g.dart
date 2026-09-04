// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: json['id'] as String,
  userTag: json['user_tag'] as String,
  avatarUrl: json['avatar_url'] as String?,
  email: json['email'] as String?,
  name: json['username'] as String?,
  address: json['address'] as String?,
  lastName: json['last_name'] as String?,
  number: json['phone_number'] as String?,
  authProvider: json['authProvider'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  friendshipStatus: json['friendship_status'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'user_tag': instance.userTag,
  'avatar_url': instance.avatarUrl,
  'email': instance.email,
  'username': instance.name,
  'address': instance.address,
  'last_name': instance.lastName,
  'phone_number': instance.number,
  'authProvider': instance.authProvider,
  'created_at': instance.createdAt?.toIso8601String(),
  'friendship_status': instance.friendshipStatus,
};
