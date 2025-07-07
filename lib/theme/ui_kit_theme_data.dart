import 'package:chat_pet/theme/ui_kit_text_theme.dart';
import 'package:chat_pet/theme/ui_kit_color_scheme.dart';
import 'package:chat_pet/ui_klt/foundation/colors_foundation.dart';
import 'package:flutter/material.dart';

class UiKitThemeData extends ThemeExtension<UiKitThemeData> {
  final UiKitColorScheme colorScheme;
  final UiKitCarosTextTheme carosTextTheme;
  final UiKitCircularStdTextTheme circularStdTextTheme;
  final ThemeMode themeMode;

  ButtonStyle textButtonStyle([Color textColor = ColorsFoundation.lightSurface]) => ButtonStyle(
        padding: WidgetStateProperty.resolveWith((_) => EdgeInsets.zero),
        minimumSize: WidgetStateProperty.resolveWith((_) => Size.zero),
        foregroundColor: WidgetStateProperty.resolveWith((_) => textColor),
        overlayColor: WidgetStateProperty.resolveWith((_) => Colors.transparent),
        textStyle:
            WidgetStateTextStyle.resolveWith((_) => UiKitCarosTextTheme(foregroundColor: textColor).captionMedium),
      );
  ButtonStyle textButtonLabelSmallStyle([Color textColor = Colors.white]) => ButtonStyle(
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          return carosTextTheme.captionMedium;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => textColor),
        overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
      );

  const UiKitThemeData({
    required this.colorScheme,
    required this.carosTextTheme,
    required this.circularStdTextTheme,
    required this.themeMode,
  });

  @override
  ThemeExtension<UiKitThemeData> copyWith({
    UiKitColorScheme? colorScheme,
    UiKitTextTheme? textStyle,
    UiKitCarosTextTheme? carosTextTheme,
    UiKitCircularStdTextTheme? circularStdTextTheme,
    ThemeMode? themeMode,
  }) {
    return UiKitThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      carosTextTheme: carosTextTheme ?? this.carosTextTheme,
      circularStdTextTheme: circularStdTextTheme ?? this.circularStdTextTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  ThemeExtension<UiKitThemeData> lerp(covariant ThemeExtension<UiKitThemeData>? other, double t) {
    if (other is! UiKitThemeData) {
      return this;
    }

    return UiKitThemeData(
      colorScheme: colorScheme,
      carosTextTheme: carosTextTheme,
      circularStdTextTheme: circularStdTextTheme,
      themeMode: themeMode,
    );
  }
}
