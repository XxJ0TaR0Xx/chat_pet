import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_update_dto.g.dart';

///`PATCH chats/{chat_id}/messages/{message_id}`.
@JsonSerializable(includeIfNull: false, createFactory: false)
class MessageUpdateDto {
  const MessageUpdateDto({this.content});

  final String? content;

  Map<String, dynamic> toJson() => _$MessageUpdateDtoToJson(this);
}
