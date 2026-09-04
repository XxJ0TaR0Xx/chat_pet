// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokensDto _$TokensDtoFromJson(Map<String, dynamic> json) => _TokensDto(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$TokensDtoToJson(_TokensDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
