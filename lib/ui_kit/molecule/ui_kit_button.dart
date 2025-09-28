import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class UiKitButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback? onTap;
  final String text;
  final Color textColor;
  final bool isDisable;

  const UiKitButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor = ColorsFoundation.surfaceBase,
    this.textColor = ColorsFoundation.darkNeutral,
    this.isDisable = false,
  });

  factory UiKitButton.primary({
    required final String text,
    final VoidCallback? onTap,
    final bool isDisable = false,
  }) {
    return UiKitButton(
      text: text,
      backgroundColor: ColorsFoundation.primary,
      onTap: onTap,
      textColor: ColorsFoundation.surfaceBase,
      isDisable: isDisable,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled) || isDisable) {
            return ColorsFoundation.backNeutral1;
          }
          return textColor;
        }),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          return context.uiKitTheme?.carosTextTheme.medium.copyWith(fontWeight: FontWeight.w900) ??
              TextStyle(color: textColor);
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled) || isDisable) {
            return ColorsFoundation.lightSurface;
          }
          return backgroundColor;
        }),
      ),
      child: Text(text).paddingVertical(SpacingFoundation.verticalSpacing16),
    );
  }
}
