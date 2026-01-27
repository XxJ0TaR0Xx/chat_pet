import 'package:chat_pet/presentation/ui_kit/theme/text_theme.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_color_scheme.dart';
import 'package:flutter/material.dart';

class UiKitThemeData extends ThemeExtension<UiKitThemeData> {
  const UiKitThemeData({
    required this.colorScheme,
    required this.carosTextTheme,
    required this.circularStdTextTheme,
    required this.themeMode,
    this.customColor,
  });
  final Color? customColor;
  final UiKitColorScheme colorScheme;

  final CarosTextTheme carosTextTheme;
  final CircularStdTextTheme circularStdTextTheme;

  final ThemeMode themeMode;

  ButtonStyle textButtonStyle([Color textColor = Colors.white]) => ButtonStyle(
    textStyle: WidgetStateTextStyle.resolveWith((states) {
      return circularStdTextTheme.medium;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) => textColor),
    overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
  );
  ButtonStyle textButtonLabelSmallStyle([Color textColor = Colors.white]) => ButtonStyle(
    textStyle: WidgetStateTextStyle.resolveWith((states) {
      return circularStdTextTheme.medium;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) => textColor),
    overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
  );

  @override
  ThemeExtension<UiKitThemeData> copyWith({
    Color? customColor,
    Color? cardColor,
    InputDecorationTheme? iconInputTheme,
    InputDecorationTheme? noIconInputTheme,
    InputDecorationTheme? noFillInputTheme,
    InputDecorationTheme? noIconInputBorderRadius24,
    AppBarTheme? customAppBapTheme,
    TabBarTheme? uiKitTabBarTheme,
    CarosTextTheme? carosTextTheme,
    CircularStdTextTheme? circularStdTextTheme,
    ButtonThemeData? buttonTheme,
    CardTheme? cardTheme,
    UiKitChipThemeData? chipTheme,
    ButtonStyle? ordinaryButtonStyle,
    BottomSheetThemeData? bottomSheetTheme,
    ButtonStyle? textButtonStyle,
    ButtonStyle? smallOrdinaryButtonStyle,
    BlurredBottomNavigationBarTheme? blurredBottomNavigationBarTheme,
    ThemeMode? themeMode,
    UiKitColorScheme? colorScheme,
  }) {
    return UiKitThemeData(
      themeMode: themeMode ?? this.themeMode,
      customColor: customColor ?? this.customColor,
      carosTextTheme: carosTextTheme ?? this.carosTextTheme,
      circularStdTextTheme: circularStdTextTheme ?? this.circularStdTextTheme,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  ThemeExtension<UiKitThemeData> lerp(ThemeExtension<UiKitThemeData>? other, double t) {
    if (other is! UiKitThemeData) {
      return this;
    }

    return UiKitThemeData(
      themeMode: themeMode,
      customColor: Color.lerp(customColor, other.customColor, t) ?? Colors.white,
      colorScheme: colorScheme,
      carosTextTheme: carosTextTheme,
      circularStdTextTheme: circularStdTextTheme,
    );
  }
}

class UiKitChipThemeData {
  const UiKitChipThemeData({
    required this.backgroundColor,
    this.border,
  });
  final Color backgroundColor;
  final Border? border;
}

class BlurredBottomNavigationBarTheme {
  const BlurredBottomNavigationBarTheme({
    required this.iconColors,
  });
  final Color iconColors;
}
