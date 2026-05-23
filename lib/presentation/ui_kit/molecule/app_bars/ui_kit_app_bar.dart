import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitAppBar extends PreferredSize {
  const UiKitAppBar({
    super.key,
    super.preferredSize = const Size(double.infinity, 84),
    super.child = const SizedBox(),
    this.leadingColor,
    this.onTap,
    this.centerTitle = true,
    this.showLeading = true,
  });

  final VoidCallback? onTap;
  final Color? leadingColor;
  final bool centerTitle;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsFoundation.transparent,
      shadowColor: ColorsFoundation.transparent,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: showLeading
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed:
                  onTap ??
                  () {
                    context.pop();
                  },
              icon: ChatPetIcon.icon(
                AppIcons.arrowBack,
                color: leadingColor ?? ColorsFoundation.darkNeutral,
              ),
            )
          : null,
      title: child,
    );
  }
}
