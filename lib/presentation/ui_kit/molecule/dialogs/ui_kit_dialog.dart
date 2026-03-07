import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitDialog {
  const UiKitDialog({
    this.backgroundColor,
    this.barrierDismissible = false,
    this.borderRadius,
    this.content,
    this.title,
  });

  final bool barrierDismissible;
  final String? title;
  final Color? backgroundColor;
  final double? borderRadius;
  final List<Widget>? content;

  Future<void> show(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      final theme = context.uiKitTheme;

      return Dialog(
        backgroundColor: theme?.colorScheme.surface1,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            SpacingFoundation.horizontalSpacing16,
          ),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingFoundation.verticalSpacing12,
          children: [
            Text(
              title ?? S.of(context).SomethingWentWrong,
              style: theme?.carosTextTheme.boldTitle,
            ),
            if (content != null) ...content!,
          ],
        ).paddingAll(EdgeInsetsFoundation.all16),
      );
    },
  );
}
