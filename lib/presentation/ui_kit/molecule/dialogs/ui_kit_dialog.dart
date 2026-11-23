import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitDialog {
  const UiKitDialog({
    this.barrierDismissible = false,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.borderRadius,
    this.content,
    this.buttons,
  });

  final bool barrierDismissible;
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final List<Widget>? content;
  final List<ButtonDialogContent>? buttons;

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
              style: titleStyle ?? theme?.carosTextTheme.title,
              textAlign: TextAlign.center,
            ),
            if (content != null) ...content!,
            if (buttons != null && buttons!.isNotEmpty)
              Row(
                spacing: SpacingFoundation.horizontalSpacing12,
                children: buttons!.map(
                  (buttonModel) {
                    if (buttonModel.isPrimary) {
                      return Expanded(
                        child: UiKitButton.primary(
                          text: buttonModel.title,
                          onTap: buttonModel.onTap,
                        ),
                      );
                    }

                    return Expanded(
                      child: UiKitButton(
                        text: buttonModel.title,
                        onTap: buttonModel.onTap,
                      ),
                    );
                  },
                ).toList(),
              ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all16),
      );
    },
  );
}

class ButtonDialogContent {
  const ButtonDialogContent._({
    required this.title,
    required this.onTap,
    this.isPrimary = false,
  });

  factory ButtonDialogContent.regular({
    required String title,
    required VoidCallback onTap,
  }) => ButtonDialogContent._(title: title, onTap: onTap);

  factory ButtonDialogContent.primary({
    required String title,
    required VoidCallback onTap,
  }) => ButtonDialogContent._(title: title, onTap: onTap, isPrimary: true);

  final String title;
  final VoidCallback onTap;
  final bool isPrimary;
}
