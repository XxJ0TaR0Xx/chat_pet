import 'package:chat_pet/presentation/ui_kit/foundation/colors_foundation.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class UiKitThemes {
  late final lightThemeData = defaultThemeData.copyWith(
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      textStyle: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    scaffoldBackgroundColor: ColorsFoundation.lightSurface,
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        // color: Color(0xffffffff),
        // color: Color(0xFF000000),
        package: 'shuffle_uikit',
      ),
    ),
    extensions: [
      UiKitThemeData(
        themeMode: ThemeMode.light,
        colorScheme: const UiKitColorScheme.light(),
        customColor: Colors.red,
        carosTextTheme: CarosTextTheme(),
        circularStdTextTheme: CircularStdTextTheme(),
      ),
    ],
  );
  late final defaultThemeData = ThemeData(
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
      textStyle: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Color(0x00000000),
        package: 'shuffle_uikit',
      ),
    ),
    scaffoldBackgroundColor: ColorsFoundation.surfaceBase,
    useMaterial3: false,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      enableFeedback: true,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          return const TextStyle(
            fontFamily: 'Unbounded',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xffffffff),
            package: 'shuffle_uikit',
            overflow: TextOverflow.ellipsis,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
        overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          return const TextStyle(
            fontFamily: 'Unbounded',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xffffffff),
            package: 'shuffle_uikit',
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
    extensions: <ThemeExtension<UiKitThemeData>>[
      UiKitThemeData(
        themeMode: ThemeMode.dark,
        customColor: Colors.red,
        carosTextTheme: CarosTextTheme(),
        circularStdTextTheme: CircularStdTextTheme(),
        colorScheme: const UiKitColorScheme.dark(),
      ),
    ],
  );

  final fallbackThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryTextTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Unbounded',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xffffffff),
        package: 'shuffle_uikit',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.resolveWith((states) => const Size.fromHeight(48)),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral : Colors.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          }

          return ColorsFoundation.darkNeutral;
        }),
      ),
    ),
    cardColor: ColorsFoundation.surfaceBase,
    appBarTheme: AppBarTheme(
      toolbarHeight: 84,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black.withValues(alpha: 0.07),
      centerTitle: true,
    ),
  );
}
