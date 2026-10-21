import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/pages/start/start_page.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../utils/pump_util.dart';

Future<void> _pumpStartPage(
  WidgetTester tester, {
  GoRouter? router,
}) async {
  final effectiveRouter =
      router ??
      GoRouter(
        initialLocation: AppRoutes.start,
        routes: [
          GoRoute(
            path: AppRoutes.start,
            builder: (_, __) => const StartPage(),
          ),
          GoRoute(
            path: AppRoutes.login,
            builder: (_, __) => const Scaffold(body: Text('Login Page')),
          ),
          GoRoute(
            path: AppRoutes.signUp,
            builder: (_, __) => const Scaffold(body: Text('SignUp Page')),
          ),
        ],
      );

  await tester.pumpWidget(pumpUtil(effectiveRouter));

  await tester.pump();
}

void main() {
  group('StartPage', () {
    group('рендеринг', () {
      testWidgets('отображает страницу без ошибок', (tester) async {
        await _pumpStartPage(tester);

        expect(find.byType(Scaffold), findsOneWidget);
      });

      testWidgets('отображает кнопку LogIn', (tester) async {
        await _pumpStartPage(tester);

        expect(find.text(S.current.LogIn), findsOneWidget);
      });

      testWidgets('отображает ссылку Sign Up', (tester) async {
        await _pumpStartPage(tester);

        expect(find.text(S.current.SignUpWithEmail), findsOneWidget);
      });

      testWidgets('отображает заголовок приложения', (tester) async {
        await _pumpStartPage(tester);

        expect(find.text(S.current.Chatbox), findsOneWidget);
      });

      testWidgets('отображает основной текст', (tester) async {
        await _pumpStartPage(tester);

        expect(find.text(S.current.ConnectFriendsEasilyQuickly), findsOneWidget);
      });
    });

    group('навигация', () {
      testWidgets('нажатие LogIn переходит на страницу логина', (tester) async {
        await _pumpStartPage(tester);

        await tester.tap(find.text(S.current.LogIn));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Login Page'), findsOneWidget);
      });

      testWidgets('нажатие Sign Up переходит на страницу регистрации', (tester) async {
        await _pumpStartPage(tester);

        await tester.tap(find.text(S.current.SignUpWithEmail));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('SignUp Page'), findsOneWidget);
      });
    });

    group('анимация', () {
      testWidgets('страница стабильна после нескольких кадров анимации', (tester) async {
        await _pumpStartPage(tester);

        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 3));

        expect(find.byType(StartPage), findsOneWidget);
      });

      testWidgets('CustomPaint отрисовывается', (tester) async {
        await _pumpStartPage(tester);

        expect(find.byType(CustomPaint), findsWidgets);
      });
    });
  });
}
