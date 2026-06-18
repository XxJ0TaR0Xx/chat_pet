import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
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
    @JsonKey(name: 'friendship_status') FriendEnum? friendshipStatus,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String get nameAndLast => '${name ?? ''} ${lastName ?? ''}'.trim();
}
