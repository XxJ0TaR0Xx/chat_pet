import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem._({
    required this.user,
    this.isOtherUsers = false,
    this.onAddUser,
    this.onDeleteUser,
  });

  factory ContactItem.my({
    required UserModel user,
    ValueChanged<String>? onDeleteUser,
  }) => ContactItem._(
    user: user,
    onDeleteUser: onDeleteUser,
  );

  factory ContactItem.other({
    required UserModel user,
    ValueChanged<String>? onAddUser,
    ValueChanged<String>? onDeleteUser,
  }) => ContactItem._(
    user: user,
    isOtherUsers: true,
    onAddUser: onAddUser,
    onDeleteUser: onDeleteUser,
  );

  final UserModel user;
  final ValueChanged<String>? onAddUser;
  final ValueChanged<String>? onDeleteUser;
  final bool isOtherUsers;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      children: [
        AvatarWidget(
          codeForGen: '123123',
          size: 52.w,
          url: user.avatarUrl,
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: SpacingFoundation.verticalSpacing8,
            children: [
              Text(
                user.nameAndLast,
                style: theme?.carosTextTheme.mediumBold,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.userTag,
                style: theme?.circularStdTextTheme.bookSmall.copyWith(
                  color: ColorsFoundation.backNeutral1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingVertical(SpacingFoundation.horizontalSpacing8),
        ),
        if (isOtherUsers)
          switch (user.friendshipStatus) {
            FriendEnum.friends => InkWell(
              onTap: () => onDeleteUser?.call(user.id),
              child: Icon(
                Icons.delete,
                color: ColorsFoundation.error.withValues(alpha: 0.5),
              ),
            ),
            FriendEnum.pendingReceived => Icon(
              Icons.timer_sharp,
              color: ColorsFoundation.green,
            ),
            FriendEnum.pendingSent => Icon(
              Icons.timer_sharp,
              color: ColorsFoundation.grayColor.withValues(alpha: 0.5),
            ),
            _ => InkWell(
              onTap: () => onAddUser?.call(user.id),
              child: ChatPetIcon.icon(AppIcons.userAdd),
            ),
          }
        else
          InkWell(
            onTap: () => onDeleteUser?.call(user.id),
            child: Icon(
              Icons.delete,
              color: ColorsFoundation.error.withValues(alpha: 0.5),
            ),
          ),
      ],
    );
  }
}
