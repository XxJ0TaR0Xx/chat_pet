import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_member_dto.freezed.dart';
part 'chat_member_dto.g.dart';

@freezed
abstract class ChatMemberDto with _$ChatMemberDto {
  const factory ChatMemberDto({
    required UserDto user,
    DateTime? lastReadAt,
  }) = _ChatMemberDto;

  factory ChatMemberDto.fromJson(Map<String, dynamic> json) => ChatMemberDto(
    user: UserDto.fromJson(json),
    lastReadAt: json['last_read_at'] == null ? null : DateTime.tryParse(json['last_read_at'] as String),
  );
}
