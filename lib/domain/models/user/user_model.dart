import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String userTag,
    String? avatarUrl,
    String? email,
    String? name,
    String? address,
    String? lastName,
    String? number,
    String? authProvider,
    DateTime? createdAt,
    FriendEnum? friendshipStatus,
  }) = _UserModel;

  const UserModel._();

  String get nameAndLast => '${name ?? ''} ${lastName ?? ''}'.trim();
}
