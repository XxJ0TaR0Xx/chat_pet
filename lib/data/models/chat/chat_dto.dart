import 'package:chat_pet/data/models/chat/chat_member_dto.dart';
import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class ChatDto with _$ChatDto {
  const factory ChatDto({
    required String id,
    required List<ChatMemberDto> members,
    @JsonKey(name: 'is_group') required bool isGroup,
    String? name,
    @JsonKey(name: 'create_at') DateTime? createAt,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'display_avatar_url') String? avatarUrl,
    @JsonKey(name: 'last_message') MessageDto? lastMessage,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
  }) = _ChatDto;

  const ChatDto._();

  factory ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);
}
