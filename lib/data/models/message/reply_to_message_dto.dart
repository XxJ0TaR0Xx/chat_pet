import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_to_message_dto.freezed.dart';
part 'reply_to_message_dto.g.dart';

/// Если оригинал удалён, бэкенд присылает только `id` и `deleted: true`, остальные поля — null.
@freezed
abstract class ReplyToMessageDto with _$ReplyToMessageDto {
  const factory ReplyToMessageDto({
    required String id,
    @JsonKey(name: 'sender_id') String? senderId,
    String? content,
    @JsonKey(name: 'content_type') ContentType? contentType,
    @Default(false) bool deleted,
  }) = _ReplyToMessageDto;

  factory ReplyToMessageDto.fromJson(Map<String, dynamic> json) => _$ReplyToMessageDtoFromJson(json);
}
