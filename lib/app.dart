import 'package:chat_pet/localization/l10n.dart';
import 'package:chat_pet/ui_kit/theme/ui_kit_theme.dart';
import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chat_pet/pages/start_page/start_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: UiKitThemes().defaultThemeData,
        home: StartPage(),
      ),
    );
  }
}
