import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitAppBar extends PreferredSize {
  const UiKitAppBar({
    super.key,
    super.preferredSize = const Size(double.infinity, 84),
    super.child = const SizedBox(),
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsFoundation.transparent,
      shadowColor: ColorsFoundation.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        style: ElevatedButton.styleFrom(splashFactory: NoSplash.splashFactory),
        onPressed: onTap ??
            () {
              context.pop();
            },
        icon: ChatPetIcon.icon(
          AppIcons.arrowBack,
          size: 24,
          color: ColorsFoundation.darkNeutral,
        ),
      ),
    );
  }
}
