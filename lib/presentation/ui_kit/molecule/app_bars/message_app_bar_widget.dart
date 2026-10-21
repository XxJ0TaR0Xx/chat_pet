import 'package:chat_pet/domain/models/chat/chat_member_model.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class MessageAppBarWidget extends PreferredSize {
  const MessageAppBarWidget._({
    required this.userModel,
    this.isActive = true,
    this.isSelectionMode = false,
    this.onDeleteTap,
    this.onForwardTap,
    this.onClearTap,
    this.selectionCount = 0,
    super.preferredSize = const Size(double.infinity, 80),
    super.child = const SizedBox(),
    super.key,
  });

  factory MessageAppBarWidget.defaultMode({
    required ChatMemberModel userModel,
    bool isActive = true,
    Key? key,
  }) => MessageAppBarWidget._(
    userModel: userModel,
    isActive: isActive,
    key: key,
  );

  factory MessageAppBarWidget.selectionMode({
    required ChatMemberModel userModel,
    required VoidCallback onDeleteTap,
    required VoidCallback onForwardTap,
    required VoidCallback onClearTap,
    bool isActive = true,
    int selectionCount = 0,
    Key? key,
  }) => MessageAppBarWidget._(
    userModel: userModel,
    onDeleteTap: onDeleteTap,
    onForwardTap: onForwardTap,
    onClearTap: onClearTap,
    isActive: isActive,
    isSelectionMode: true,
    selectionCount: selectionCount,
    key: key,
  );

  final ChatMemberModel userModel;
  final bool isActive;
  final bool isSelectionMode;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onForwardTap;
  final VoidCallback? onClearTap;
  final int selectionCount;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.uiKitTheme?.colorScheme.surface1 ?? Colors.white,
      child:
          Row(
            children: isSelectionMode ? _selectionModeWidgets(context) : _defaultModeWidgets(context),
          ).paddingSymmetric(
            vertical: SpacingFoundation.verticalSpacing16,
            horizontal: SpacingFoundation.horizontalSpacing24,
          ),
    );
  }

  List<Widget> _selectionModeWidgets(BuildContext context) {
    final theme = context.uiKitTheme;

    return [
      InkWell(
        onTap: onClearTap,
        child: Icon(
          Icons.close,
          color: theme?.colorScheme.surface,
        ),
      ),
      SpacingFoundation.horizontalSpace12,
      Expanded(
        child: Text(
          '$selectionCount ${S.of(context).Selected.toLowerCase()}',
          style: theme?.carosTextTheme.bold,
        ),
      ),
      SpacingFoundation.horizontalSpace8,
      ChatPetIcon.icon(AppIcons.reply, onTap: onForwardTap),
      SpacingFoundation.horizontalSpace16,
      ChatPetIcon.icon(AppIcons.trash, color: theme?.colorScheme.error, onTap: onDeleteTap),
    ];
  }

  List<Widget> _defaultModeWidgets(BuildContext context) {
    final theme = context.uiKitTheme;

    return [
      InkWell(
        onTap: context.pop,
        child: ChatPetIcon.icon(AppIcons.arrowBack),
      ),
      SpacingFoundation.horizontalSpace12,
      AvatarWidget(
        isOnline: isActive,
        url: userModel.user.avatarUrl,
      ),
      SpacingFoundation.horizontalSpace12,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingFoundation.verticalSpacing6,
          children: [
            Text(
              userModel.user.nameAndLast,
              style: theme?.carosTextTheme.mediumBold,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              isActive ? S.of(context).ActiveNow : S.of(context).ActiveNotNow,
              style: theme?.circularStdTextTheme.bookSmall.copyWith(
                color: theme.colorScheme.mutedColor,
              ),
            ),
          ],
        ),
      ),
      SpacingFoundation.horizontalSpace8,
      ChatPetIcon.icon(AppIcons.call),
      SpacingFoundation.horizontalSpace16,
      ChatPetIcon.icon(AppIcons.video),
    ];
  }
}
