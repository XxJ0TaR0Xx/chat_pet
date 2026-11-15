import 'dart:async';

import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/presentation/bootstrap/server_selection_page.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Release builds start with Prod. Other builds wait for server selection.
/// The application stays unmounted until initialization completes successfully.
class AppBootstrap extends StatefulWidget {
  const AppBootstrap({
    required this.initialize,
    required this.appBuilder,
    this.showServerSelection = !kReleaseMode,
    super.key,
  });

  final Future<void> Function(ApiConfig config) initialize;
  final WidgetBuilder appBuilder;
  final bool showServerSelection;

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

enum _BootstrapPhase { selecting, initializing, ready, failed }

class _AppBootstrapState extends State<AppBootstrap> {
  _BootstrapPhase _phase = _BootstrapPhase.selecting;

  @override
  void initState() {
    super.initState();
    if (!widget.showServerSelection) {
      unawaited(_select(ApiConfig.prod()));
    }
  }

  Future<void> _select(ApiConfig config) async {
    if (_phase != _BootstrapPhase.selecting) return;

    setState(() {
      _phase = _BootstrapPhase.initializing;
    });

    try {
      await widget.initialize(config);
      if (!mounted) return;
      setState(() => _phase = _BootstrapPhase.ready);
    } catch (error, stackTrace) {
      talk.error('Application initialization failed: $error\n$stackTrace');
      if (!mounted) return;
      setState(() => _phase = _BootstrapPhase.failed);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_phase == _BootstrapPhase.ready) return widget.appBuilder(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: UiKitThemes().defaultThemeData,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Builder(
          builder: (context) => ServerSelectionPage(
            initializing: _phase == _BootstrapPhase.initializing,
            failed: _phase == _BootstrapPhase.failed,
            onSelected: _select,
          ),
        ),
      ),
    );
  }
}
