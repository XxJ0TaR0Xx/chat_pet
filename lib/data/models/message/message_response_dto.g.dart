// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModelResponseDto _$MessageModelResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MessageModelResponseDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  cursor: json['next_cursor'] as String?,
);

Map<String, dynamic> _$MessageModelResponseDtoToJson(
  _MessageModelResponseDto instance,
) => <String, dynamic>{'items': instance.items, 'next_cursor': instance.cursor};
