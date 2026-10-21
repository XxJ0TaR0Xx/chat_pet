import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

enum UiKitButtonSize {
  s,
  sFull,
  m,
  mFull,
  l,
  lFull
  ;

  bool get isFull => this == UiKitButtonSize.sFull || this == UiKitButtonSize.mFull || this == UiKitButtonSize.lFull;

  double get verticalPadding => switch (this) {
    UiKitButtonSize.s || UiKitButtonSize.sFull => SpacingFoundation.verticalSpacing8,
    UiKitButtonSize.m || UiKitButtonSize.mFull => SpacingFoundation.verticalSpacing12,
    UiKitButtonSize.l || UiKitButtonSize.lFull => SpacingFoundation.verticalSpacing16,
  };

  double get borderRadius => switch (this) {
    UiKitButtonSize.s || UiKitButtonSize.sFull => 8,
    UiKitButtonSize.m || UiKitButtonSize.mFull => 12,
    UiKitButtonSize.l || UiKitButtonSize.lFull => 16,
  };
}

class UiKitButton extends StatelessWidget {
  const UiKitButton({
    required this.text,
    super.key,
    this.onTap,
    this.backgroundColor = ColorsFoundation.surfaceBase,
    this.textColor = ColorsFoundation.darkNeutral,
    this.isDisable = false,
    this.isLoading = false,
    this.size = UiKitButtonSize.m,
  });

  factory UiKitButton.primary({
    required String text,
    VoidCallback? onTap,
    bool isDisable = false,
    bool isLoading = false,
    UiKitButtonSize size = UiKitButtonSize.m,
  }) {
    return UiKitButton(
      text: text,
      backgroundColor: ColorsFoundation.primary,
      onTap: onTap,
      textColor: ColorsFoundation.surfaceBase,
      isDisable: isDisable,
      isLoading: isLoading,
      size: size,
    );
  }

  final Color backgroundColor;
  final VoidCallback? onTap;
  final String text;
  final Color textColor;
  final bool isDisable;
  final bool isLoading;
  final UiKitButtonSize size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable ? null : onTap,
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(size.isFull ? double.infinity : 0, 0),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: size.verticalPadding,
            horizontal: SpacingFoundation.horizontalSpacing16,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.borderRadius),
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled) || isDisable) {
            return ColorsFoundation.backNeutral1;
          }
          return textColor;
        }),
        textStyle: WidgetStatePropertyAll(
          context.uiKitTheme?.carosTextTheme.medium.copyWith(fontWeight: FontWeight.w900) ?? TextStyle(color: textColor),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled) || isDisable) {
            return ColorsFoundation.lightSurface;
          }
          return backgroundColor;
        }),
      ),
      child: isLoading
          ? SizedBox(
              height: 24.h,
              width: 24.h,
              child: CircularProgressIndicator(
                color: context.uiKitTheme?.colorScheme.inverseSurface,
              ),
            )
          : Text(text),
    );
  }
}
