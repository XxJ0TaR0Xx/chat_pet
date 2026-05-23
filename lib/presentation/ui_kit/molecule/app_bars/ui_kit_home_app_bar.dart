import 'package:avatar_plus/avatar_plus.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UiKitHomeAppBar extends PreferredSize {
  const UiKitHomeAppBar({
    super.key,
    super.preferredSize = const Size(double.infinity, 64),
    super.child = const SizedBox(),
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final avatarSize = 44.w;

    return AppBar(
      backgroundColor: ColorsFoundation.transparent,
      shadowColor: ColorsFoundation.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsFoundation.borderColor,
                    width: 1.5.w,
                  ),
                ),
                child: ChatPetIcon.icon(
                  AppIcons.search,
                  size: 24.w,
                  color: ColorsFoundation.surfaceBase,
                ).paddingAll(EdgeInsetsFoundation.all10),
              ),
            ),
            Text(
              'Home',
              style: theme?.carosTextTheme.bold.copyWith(
                fontSize: 20.w,
                color: theme.colorScheme.surfaceBase,
              ),
            ),
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.string(
                AvatarPlusGen.instance.generate("asd"),
              ),
            ),
          ],
        ).paddingOnly(
          top: SpacingFoundation.verticalSpacing16,
          left: SpacingFoundation.horizontalSpacing24,
          right: SpacingFoundation.horizontalSpacing24,
        ),
      ),
    );
  }
}
