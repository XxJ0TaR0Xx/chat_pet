import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.icon,
    required this.title,
    super.key,
    this.subtitle,
    this.actionText,
    this.onActionTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 56.w,
              color: ColorsFoundation.backNeutral2,
            ),
            SpacingFoundation.verticalSpace16,
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme?.carosTextTheme.boldTitle,
            ),
            if (subtitle != null) ...[
              SpacingFoundation.verticalSpace8,
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: theme?.carosTextTheme.medium.copyWith(
                  color: ColorsFoundation.backNeutral2,
                ),
              ),
            ],
            if (actionText != null && onActionTap != null) ...[
              SpacingFoundation.verticalSpace24,
              UiKitButton.primary(
                text: actionText!,
                onTap: onActionTap,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
