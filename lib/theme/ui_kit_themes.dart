import 'package:chat_pet/ui_klt/ui_kit.dart';

import 'theme.dart';
import 'package:flutter/material.dart';

class UiKitThemes {
  late final lightThemeData = defaultThemeData.copyWith(
    dividerColor: ColorsFoundation.backNeutral3,
    scaffoldBackgroundColor: ColorsFoundation.surfaceBase,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0, backgroundColor: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((_) => ColorsFoundation.primary),
        overlayColor: WidgetStateProperty.resolveWith((_) => Colors.transparent),
        textStyle: WidgetStateTextStyle.resolveWith(
          (_) => UiKitCarosTextTheme(foregroundColor: ColorsFoundation.primary).captionMedium,
        ),
      ),
    ),
    extensions: [
      UiKitThemeData(
        themeMode: ThemeMode.light,
        colorScheme: UiKitColorScheme.light(),
        carosTextTheme: UiKitCarosTextTheme(),
        circularStdTextTheme: UiKitCircularStdTextTheme(),
      ),
    ],
  );
  late final defaultThemeData = ThemeData(
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      textStyle: TextStyle(
        fontFamily: 'Caros',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0x00000000),
      ),
    ),
    scaffoldBackgroundColor: ColorsFoundation.surfaceBase,
    useMaterial3: false,
    // splashFactory: WaveSplash.splashFactory,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      enableFeedback: true,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          return const TextStyle(
            fontFamily: 'Caros',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xffffffff),
            overflow: TextOverflow.ellipsis,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
        overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsFoundation.primary,
      onSurface: Colors.white,
      brightness: Brightness.dark,
    ),
  );
}
