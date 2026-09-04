// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactDto _$ContactDtoFromJson(Map<String, dynamic> json) => _ContactDto(
  since: DateTime.parse(json['since'] as String),
  user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContactDtoToJson(_ContactDto instance) =>
    <String, dynamic>{
      'since': instance.since.toIso8601String(),
      'user': instance.user,
    };
