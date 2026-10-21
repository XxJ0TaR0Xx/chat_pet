import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    @JsonKey(name: 'user_tag') required String userTag,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? email,
    @JsonKey(name: 'username') String? name,
    String? address,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone_number') String? number,
    String? authProvider,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'friendship_status') String? friendshipStatus,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
