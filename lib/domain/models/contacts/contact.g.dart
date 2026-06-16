// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  since: DateTime.parse(json['since'] as String),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'since': instance.since.toIso8601String(),
  'user': instance.user,
};
