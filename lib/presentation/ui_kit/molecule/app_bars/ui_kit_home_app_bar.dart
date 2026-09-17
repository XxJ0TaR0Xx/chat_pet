import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitHomeAppBar extends PreferredSize {
  const UiKitHomeAppBar({
    super.preferredSize = const Size(double.infinity, 64),
    super.child = const SizedBox(),
    this.onTap,
    this.title,
    this.action,
    super.key,
  });

  final VoidCallback? onTap;
  final String? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return AppBar(
      backgroundColor: ColorsFoundation.transparent,
      shadowColor: ColorsFoundation.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 44.w,
                    height: 44.w,
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
                    ).paddingAll(EdgeInsetsFoundation.all8),
                  ),
                ),
                Text(
                  title ?? S.of(context).Home,
                  style: theme?.carosTextTheme.mediumBold.copyWith(
                    fontSize: 20.w,
                    color: theme.colorScheme.surfaceBase,
                  ),
                ),
                action ?? const SizedBox.shrink(),
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
