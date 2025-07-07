import 'package:chat_pet/theme/ui_kit_themes.dart';
import 'package:chat_pet/ui_klt/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: UiKitThemes().lightThemeData,
        home: StartPage(),
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    logNoStack.d('theme == null ${theme == null}');

    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: theme?.circularStdTextTheme.captionMedium,
        ),
      ),
    );
  }
}
