import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    required this.title,
    required this.icon,
    super.key,
    this.isActive = false,
    this.onTap,
  });

  final String title;
  final AppIcons icon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? ColorsFoundation.primary : ColorsFoundation.backNeutral1;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChatPetIcon.icon(
            icon,
            color: color,
            size: 26.w,
          ),
          SpacingFoundation.verticalSpace6,
          Text(
            title,
            style: context.uiKitTheme?.carosTextTheme.bold.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
