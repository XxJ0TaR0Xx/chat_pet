import 'package:chat_pet/ui_kit/theme/text_theme.dart';
import 'package:chat_pet/ui_kit/theme/ui_kit_color_scheme.dart';
import 'package:flutter/material.dart';

class UiKitThemeData extends ThemeExtension<UiKitThemeData> {
  final Color customColor;
  final Color cardColor;
  final UiKitColorScheme colorScheme;
  final InputDecorationTheme iconInputTheme;
  final InputDecorationTheme noIconInputTheme;
  final InputDecorationTheme noIconInputBorderRadius20;
  final InputDecorationTheme noFillInputTheme;
  final AppBarTheme customAppBapTheme;
  final TabBarTheme uiKitTabBarTheme;
  final CarosTextTheme carosTextTheme;
  final CircularStdTextTheme circularStdTextTheme;
  final ButtonThemeData buttonTheme;
  final CardTheme cardTheme;
  final UiKitChipThemeData chipTheme;
  final ButtonStyle ordinaryButtonStyle;
  final ButtonStyle smallOrdinaryButtonStyle;
  final BottomSheetThemeData bottomSheetTheme;
  final BlurredBottomNavigationBarTheme blurredBottomNavigationBarTheme;
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

  const UiKitThemeData({
    required this.iconInputTheme,
    required this.blurredBottomNavigationBarTheme,
    required this.ordinaryButtonStyle,
    required this.noIconInputTheme,
    required this.noFillInputTheme,
    required this.chipTheme,
    required this.customColor,
    required this.colorScheme,
    required this.customAppBapTheme,
    required this.uiKitTabBarTheme,
    required this.carosTextTheme,
    required this.circularStdTextTheme,
    required this.cardColor,
    required this.buttonTheme,
    required this.cardTheme,
    required this.bottomSheetTheme,
    required this.smallOrdinaryButtonStyle,
    required this.themeMode,
    required this.noIconInputBorderRadius20,
  });

  @override
  //ignore: long-parameter-list
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
      noIconInputBorderRadius20: noIconInputBorderRadius24 ?? noIconInputBorderRadius20,
      themeMode: themeMode ?? this.themeMode,
      customColor: customColor ?? this.customColor,
      blurredBottomNavigationBarTheme: blurredBottomNavigationBarTheme ?? this.blurredBottomNavigationBarTheme,
      cardColor: cardColor ?? this.cardColor,
      iconInputTheme: iconInputTheme ?? this.iconInputTheme,
      noIconInputTheme: noIconInputTheme ?? this.noIconInputTheme,
      noFillInputTheme: noFillInputTheme ?? this.noFillInputTheme,
      customAppBapTheme: customAppBapTheme ?? this.customAppBapTheme,
      uiKitTabBarTheme: uiKitTabBarTheme ?? this.uiKitTabBarTheme,
      carosTextTheme: carosTextTheme ?? this.carosTextTheme,
      circularStdTextTheme: circularStdTextTheme ?? this.circularStdTextTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      cardTheme: cardTheme ?? this.cardTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      ordinaryButtonStyle: ordinaryButtonStyle ?? this.ordinaryButtonStyle,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      smallOrdinaryButtonStyle: smallOrdinaryButtonStyle ?? this.smallOrdinaryButtonStyle,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  ThemeExtension<UiKitThemeData> lerp(ThemeExtension<UiKitThemeData>? other, double t) {
    if (other is! UiKitThemeData) {
      return this;
    }

    return UiKitThemeData(
      noIconInputBorderRadius20: noIconInputBorderRadius20,
      themeMode: themeMode,
      customColor: Color.lerp(customColor, other.customColor, t) ?? Colors.white,
      colorScheme: colorScheme,
      iconInputTheme: iconInputTheme,
      noIconInputTheme: noIconInputTheme,
      noFillInputTheme: noFillInputTheme,
      customAppBapTheme: customAppBapTheme,
      uiKitTabBarTheme: uiKitTabBarTheme,
      carosTextTheme: carosTextTheme,
      circularStdTextTheme: circularStdTextTheme,
      cardColor: cardColor,
      buttonTheme: buttonTheme,
      cardTheme: cardTheme,
      chipTheme: chipTheme,
      ordinaryButtonStyle: ordinaryButtonStyle,
      bottomSheetTheme: bottomSheetTheme,
      smallOrdinaryButtonStyle: smallOrdinaryButtonStyle,
      blurredBottomNavigationBarTheme: blurredBottomNavigationBarTheme,
    );
  }
}

class UiKitChipThemeData {
  final Color backgroundColor;
  final Border? border;

  const UiKitChipThemeData({
    required this.backgroundColor,
    this.border,
  });
}

class BlurredBottomNavigationBarTheme {
  final Color iconColors;

  const BlurredBottomNavigationBarTheme({
    required this.iconColors,
  });
}
