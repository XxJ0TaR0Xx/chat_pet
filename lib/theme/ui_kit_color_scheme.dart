import 'package:chat_pet/ui_klt/foundation/colors_foundation.dart';
import 'package:flutter/material.dart';

class UiKitColorScheme extends ColorScheme {
  final Color surface1;
  final Color uiPrimary;
  final Color grayForegroundColor;
  final Color info = ColorsFoundation.info;
  final Color bodyTypography;
  final Color inverseBodyTypography;
  final Color headingTypography;
  final Color inverseHeadingTypography;
  final Color mutedText;

  @override
  final Color inversePrimary;

  const UiKitColorScheme.light({
    super.surface = ColorsFoundation.surfaceBase,
    this.surface1 = ColorsFoundation.lightSurface,
    this.uiPrimary = ColorsFoundation.darkNeutral,
    this.inversePrimary = ColorsFoundation.surfaceBase,
    this.grayForegroundColor = ColorsFoundation.backNeutral1,
    this.bodyTypography = ColorsFoundation.darkNeutral,
    this.inverseBodyTypography = ColorsFoundation.surfaceBase,
    this.headingTypography = ColorsFoundation.darkNeutral,
    this.inverseHeadingTypography = ColorsFoundation.surfaceBase,
    this.mutedText = ColorsFoundation.backNeutral1,
  }) : super.light(primary: uiPrimary, inversePrimary: inversePrimary);
}
