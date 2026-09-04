// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactModelRequestDto _$ContactModelRequestDtoFromJson(
  Map<String, dynamic> json,
) => _ContactModelRequestDto(
  id: json['id'] as String,
  sender: UserDto.fromJson(json['sender'] as Map<String, dynamic>),
  receiver: json['receiver'] == null
      ? null
      : UserDto.fromJson(json['receiver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContactModelRequestDtoToJson(
  _ContactModelRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'sender': instance.sender,
  'receiver': instance.receiver,
};
