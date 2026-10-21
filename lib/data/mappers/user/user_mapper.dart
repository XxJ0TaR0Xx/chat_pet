import 'package:chat_pet/data/models/user/update_user_dto.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';

extension UserDtoMapper on UserDto {
  UserModel toDomain() => UserModel(
    id: id,
    userTag: userTag,
    avatarUrl: avatarUrl,
    email: email,
    name: name,
    address: address,
    lastName: lastName,
    number: number,
    authProvider: authProvider,
    createdAt: createdAt,
    friendshipStatus: friendEnumFromRaw(friendshipStatus),
  );
}

extension UserUpdatePayload on UserModel {
  UpdateUserDto toUpdateDto() => UpdateUserDto(
    name: name,
    lastName: lastName,
    address: address,
    phoneNumber: number,
  );
}

FriendEnum? friendEnumFromRaw(String? raw) => switch (raw) {
  'pending_sent' => FriendEnum.pendingSent,
  'pending_received' => FriendEnum.pendingReceived,
  'friends' => FriendEnum.friends,
  _ => null,
};
