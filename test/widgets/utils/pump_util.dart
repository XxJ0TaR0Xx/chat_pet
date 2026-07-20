import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

ScreenUtilInit pumpUtil(GoRouter effectiveRouter) => ScreenUtilInit(
  designSize: const Size(375, 812),
  child: MaterialApp.router(
    routerConfig: effectiveRouter,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
  ),
);
