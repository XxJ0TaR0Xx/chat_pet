import 'package:chat_pet/presentation/ui_kit/foundation/colors_foundation.dart';
import 'package:flutter/material.dart';

class UiKitColorScheme extends ColorScheme {
  //TODO when implement black theme
  const UiKitColorScheme.dark({
    this.surfaceBase = ColorsFoundation.surfaceBase,
    this.surface1 = ColorsFoundation.lightSurface,
    this.surface2 = ColorsFoundation.lightSurface2,
    this.uiPrimary = ColorsFoundation.primary,
    this.uiPrimary2 = ColorsFoundation.primary2,
    this.uiPrimary3 = ColorsFoundation.primary3,
    this.uiPrimary4 = ColorsFoundation.primary4,
    this.uiPrimary5 = ColorsFoundation.primary5,
    this.backgroundColor = ColorsFoundation.backHelloPage,
    this.textColor = ColorsFoundation.textColor,
    this.grayForegroundColor = ColorsFoundation.grayColor,
    this.mutedColor = ColorsFoundation.mutedText,
    this.inversePrimary = ColorsFoundation.lightSurface,
    this.transparent = ColorsFoundation.transparent,
    super.surface = ColorsFoundation.backHelloPage,
    this.green = ColorsFoundation.green,
  }) : super.dark(primary: uiPrimary, inversePrimary: inversePrimary);

  const UiKitColorScheme.light({
    this.surfaceBase = ColorsFoundation.surfaceBase,
    this.surface1 = ColorsFoundation.lightSurface,
    this.surface2 = ColorsFoundation.lightSurface2,
    this.uiPrimary = ColorsFoundation.primary,
    this.uiPrimary2 = ColorsFoundation.primary2,
    this.uiPrimary3 = ColorsFoundation.primary3,
    this.uiPrimary4 = ColorsFoundation.primary4,
    this.uiPrimary5 = ColorsFoundation.primary5,
    this.backgroundColor = ColorsFoundation.backHelloPage,
    this.textColor = ColorsFoundation.textColor,
    this.grayForegroundColor = ColorsFoundation.grayColor,
    this.mutedColor = ColorsFoundation.mutedText,
    this.inversePrimary = ColorsFoundation.backHelloPage,
    this.transparent = ColorsFoundation.transparent,
    super.surface = ColorsFoundation.lightSurface,
    this.green = ColorsFoundation.green,
  }) : super.light(primary: uiPrimary, inversePrimary: inversePrimary);

  final Color surfaceBase;
  final Color surface1;
  final Color surface2;
  final Color uiPrimary;
  final Color uiPrimary2;
  final Color uiPrimary3;
  final Color uiPrimary4;
  final Color uiPrimary5;
  final Color darkNeutral = ColorsFoundation.darkNeutral;
  final Color grayForegroundColor;
  final Color info = ColorsFoundation.info;
  final Color backgroundColor;
  final Color textColor;
  final Color mutedColor;
  final Color transparent;
  final Color green;

  @override
  final Color inversePrimary;
}
