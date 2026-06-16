// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactRequest _$ContactRequestFromJson(Map<String, dynamic> json) =>
    _ContactRequest(
      id: json['id'] as String,
      sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : UserModel.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactRequestToJson(_ContactRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
