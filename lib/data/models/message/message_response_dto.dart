import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_response_dto.freezed.dart';
part 'message_response_dto.g.dart';

@freezed
abstract class MessageModelResponseDto with _$MessageModelResponseDto {
  const factory MessageModelResponseDto({
    required List<MessageDto> items,
    @JsonKey(name: 'next_cursor') String? cursor,
  }) = _MessageModelResponseDto;

  factory MessageModelResponseDto.fromJson(Map<String, dynamic> json) => _$MessageModelResponseDtoFromJson(json);
}
