import 'dart:async';

import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/login/cubit/login_cubit.dart';
import 'package:chat_pet/presentation/pages/login/login_page.dart';
import 'package:chat_pet/presentation/pages/start/widgets/social_links_widget.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/pump_util.dart';
import 'login_page_test.mocks.dart';

Future<void> _loginPump(
  WidgetTester tester,
  MockLoginCubit mockLoginCubit,
  MockUserCubit mockUserCubit,
) async {
  final route = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>.value(value: mockLoginCubit),
            BlocProvider<UserCubit>.value(value: mockUserCubit),
          ],
          child: const LoginPage(),
        ),
      ),
    ],
  );

  await tester.pumpWidget(pumpUtil(route));
  await tester.pump();
}

@GenerateMocks([LoginCubit, UserCubit])
void main() {
  late MockLoginCubit mockLoginCubit;
  late MockUserCubit mockUserCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
    when(mockLoginCubit.state).thenReturn(const LoginState.initial());
    when(mockLoginCubit.stream).thenAnswer((_) => const Stream.empty());

    mockUserCubit = MockUserCubit();
  });

  group('Login page', () {
    group('Rendering', () {
      testWidgets('Current display page', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(SliverAppBar), findsOneWidget);
      });

      testWidgets('Current display LogInToChatbox', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.text(S.current.LogInToChatbox), findsOneWidget);
      });

      testWidgets('Current display SocialLinksWidget', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.byType(SocialLinksWidget), findsOneWidget);
      });

      testWidgets('Current display two textFiled', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.byType(TextField), findsNWidgets(2));
      });

      testWidgets('Current display Forget password button', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.text(S.current.ForgotPassword), findsOneWidget);
      });
    });

    group('BlocBuilder', () {
      testWidgets('Loading state', (tester) async {
        when(mockLoginCubit.state).thenReturn(const LoginState.loading());
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    group('UiKitTextFiled', () {
      testWidgets('email: empty, show error', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).first, '');
        await tester.pump();

        expect(find.text(S.current.ThisFieldCannotBeEmpty), findsWidgets);
      });

      testWidgets('email: only space, show error', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).first, '      ');
        await tester.pump();

        expect(find.text(S.current.ThisFieldCannotBeEmpty), findsWidgets);
      });

      testWidgets('email: not empty, nothing to show', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).first, 'user@test.com');
        await tester.pump();

        expect(find.text(S.current.ThisFieldCannotBeEmpty), findsNothing);
      });

      testWidgets('password: not show error', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).last, '');
        await tester.pump();

        expect(find.text(S.current.ThisFieldCannotBeEmpty), findsWidgets);
      });

      testWidgets('password: short password error', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).last, '123');
        await tester.pump();

        expect(find.text(S.current.PasswordMinLength), findsOneWidget);
      });

      testWidgets('password: success', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).last, '123456');
        await tester.pump();

        expect(find.text(S.current.PasswordMinLength), findsNothing);
      });

      testWidgets('Show/Hide eye', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        final before = tester.widget<TextField>(find.byType(TextField).last);
        expect(before.obscureText, isTrue);

        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pump();

        final after = tester.widget<TextField>(find.byType(TextField).last);
        expect(after.obscureText, isFalse);
      });
    });

    group('Login button', () {
      testWidgets('not valid data, cubit.login dont called', (tester) async {
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).first, '');
        await tester.pump();

        await tester.tap(find.text(S.current.LogIn));
        await tester.pump();

        verifyNever(mockLoginCubit.login(any, any));
      });

      testWidgets('valid data, cubit.login will be called', (tester) async {
        when(mockLoginCubit.login(any, any)).thenAnswer((_) async {});
        await _loginPump(tester, mockLoginCubit, mockUserCubit);

        await tester.enterText(find.byType(TextField).first, 'test@gmail.com');
        await tester.pump();

        await tester.enterText(find.byType(TextField).last, '123456');
        await tester.pump();

        await tester.tap(find.text(S.current.LogIn));
        await tester.pump();

        verify(mockLoginCubit.login(any, any)).called(1);
      });
    });
  });
}
