// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  userTag: json['user_tag'] as String,
  avatarUrl: json['avatar_url'] as String?,
  email: json['email'] as String?,
  name: json['username'] as String?,
  address: json['address'] as String?,
  lastName: json['last_name'] as String?,
  number: json['phone_number'] as String?,
  authProvider: json['authProvider'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  friendshipStatus: $enumDecodeNullable(
    _$FriendEnumEnumMap,
    json['friendship_status'],
  ),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_tag': instance.userTag,
      'avatar_url': instance.avatarUrl,
      'email': instance.email,
      'username': instance.name,
      'address': instance.address,
      'last_name': instance.lastName,
      'phone_number': instance.number,
      'authProvider': instance.authProvider,
      'createdAt': instance.createdAt?.toIso8601String(),
      'friendship_status': _$FriendEnumEnumMap[instance.friendshipStatus],
    };

const _$FriendEnumEnumMap = {
  FriendEnum.pendingSent: 'pending_sent',
  FriendEnum.pendingReceived: 'pending_received',
  FriendEnum.friends: 'friends',
};
