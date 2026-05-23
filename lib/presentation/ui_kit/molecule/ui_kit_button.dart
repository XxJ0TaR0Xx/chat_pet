import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

//TODO size
class UiKitButton extends StatelessWidget {
  const UiKitButton({
    required this.text,
    super.key,
    this.onTap,
    this.backgroundColor = ColorsFoundation.surfaceBase,
    this.textColor = ColorsFoundation.darkNeutral,
    this.isDisable = false,
    this.isLoading = false,
  });
  factory UiKitButton.primary({
    required String text,
    VoidCallback? onTap,
    bool isDisable = false,
    bool isLoading = false,
  }) {
    return UiKitButton(
      text: text,
      backgroundColor: ColorsFoundation.primary,
      onTap: onTap,
      textColor: ColorsFoundation.surfaceBase,
      isDisable: isDisable,
      isLoading: isLoading,
    );
  }
  final Color backgroundColor;
  final VoidCallback? onTap;
  final String text;
  final Color textColor;
  final bool isDisable;
  final bool isLoading;

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
          return context.uiKitTheme?.carosTextTheme.medium.copyWith(fontWeight: FontWeight.w900) ?? TextStyle(color: textColor);
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled) || isDisable) {
            return ColorsFoundation.lightSurface;
          }
          return backgroundColor;
        }),
      ),
      child:
          (isLoading
                  ? SizedBox(
                      height: 24.h,
                      width: 24.h,
                      child: CircularProgressIndicator(
                        color: context.uiKitTheme?.colorScheme.inverseSurface,
                      ),
                    )
                  : Text(text))
              .paddingVertical(
                SpacingFoundation.verticalSpacing16,
              ),
    );
  }
}
