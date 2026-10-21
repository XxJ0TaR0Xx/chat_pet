import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

abstract class ContactItem extends StatelessWidget {
  const ContactItem({
    required this.user,
    this.onDeleteUser,
    super.key,
  });

  factory ContactItem.my({
    required UserModel user,
    ValueChanged<String>? onDeleteUser,
    ValueChanged<String>? onTap,
  }) => _MyContactsItem(
    user: user,
    onDeleteUser: onDeleteUser,
    onTap: onTap,
  );

  factory ContactItem.other({
    required UserModel user,
    ValueChanged<String>? onAddUser,
    ValueChanged<String>? onDeleteUser,
  }) => _OtherContactItem(
    user: user,
    onAddUser: onAddUser,
    onDeleteUser: onDeleteUser,
  );

  final UserModel user;
  final ValueChanged<String>? onDeleteUser;
}

class _MyContactsItem extends ContactItem {
  const _MyContactsItem({
    required super.user,
    required super.onDeleteUser,
    this.onTap,
  });

  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!(user.id),
            child: _CommonContactPart(user: user),
          ),
        ),
        if (onDeleteUser != null)
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

class _OtherContactItem extends ContactItem {
  const _OtherContactItem({
    required super.user,
    super.onDeleteUser,
    this.onAddUser,
  });

  final ValueChanged<String>? onAddUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CommonContactPart(user: user),
        const Spacer(),
        switch (user.friendshipStatus) {
          FriendEnum.friends => InkWell(
            onTap: () => onDeleteUser?.call(user.id),
            child: Icon(
              Icons.delete,
              color: ColorsFoundation.error.withValues(alpha: 0.5),
            ),
          ),
          FriendEnum.pendingReceived => const Icon(
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
        },
      ],
    );
  }
}

class _CommonContactPart extends StatelessWidget {
  const _CommonContactPart({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      children: [
        AvatarWidget(
          size: 52.w,
          url: user.avatarUrl,
        ),
        SpacingFoundation.horizontalSpace12,
        Column(
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
      ],
    );
  }
}
