import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String id,
    @JsonKey(name: 'chat_id') required String chatId,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'content_type') required ContentType contentType,
    @JsonKey(name: 'created_at') required DateTime createAt,
    required String content,
    @JsonKey(name: 'is_edited') @Default(false) bool isEditing,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);
}
