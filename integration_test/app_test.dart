import 'dart:async';

import 'package:chat_pet/app.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/contact_request/contact_requests_cubit.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/all_chats_page.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/cubit/contacts_cubit.dart';
import 'package:chat_pet/presentation/pages/login/cubit/login_cubit.dart';
import 'package:chat_pet/presentation/pages/login/login_page.dart';
import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/pages/start/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_test.mocks.dart';

const _fakeUser = UserModel(id: 'u1', userTag: '@tester', name: 'Test', lastName: 'User');

@GenerateMocks([
  UserCubit,
  LoginCubit,
  ChatCubit,
  ContactsCubit,
  SettingCubit,
  ContactModelRequestsCubit,
])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockUserCubit mockUserCubit;
  late MockLoginCubit mockLoginCubit;
  late MockChatCubit mockChatCubit;
  late MockContactsCubit mockContactsCubit;
  late MockSettingCubit mockSettingCubit;
  late MockContactModelRequestsCubit mockContactModelRequestsCubit;
  late StreamController<LoginState> loginStateController;

  setUp(() {
    mockUserCubit = MockUserCubit();
    mockLoginCubit = MockLoginCubit();
    mockChatCubit = MockChatCubit();
    mockContactsCubit = MockContactsCubit();
    mockSettingCubit = MockSettingCubit();
    mockContactModelRequestsCubit = MockContactModelRequestsCubit();

    loginStateController = StreamController<LoginState>.broadcast();

    when(mockUserCubit.state).thenReturn(const UserState(isLoading: false));
    when(mockUserCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockLoginCubit.state).thenReturn(const LoginState.initial());
    when(mockLoginCubit.stream).thenAnswer((_) => loginStateController.stream);

    when(mockChatCubit.state).thenReturn(const ChatState.loaded(<ChatModel>[]));
    when(mockChatCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(<String, List<UserModel>>{}));
    when(mockContactsCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockSettingCubit.state).thenReturn(const SettingState.loaded(_fakeUser));
    when(mockSettingCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockContactModelRequestsCubit.state).thenReturn(const ContactModelRequestState());
    when(mockContactModelRequestsCubit.stream).thenAnswer((_) => const Stream.empty());

    getIt.registerFactory<UserCubit>(() => mockUserCubit);
    getIt.registerFactory<LoginCubit>(() => mockLoginCubit);
    getIt.registerFactory<ChatCubit>(() => mockChatCubit);
    getIt.registerFactory<ContactsCubit>(() => mockContactsCubit);
    getIt.registerFactory<SettingCubit>(() => mockSettingCubit);
    getIt.registerFactory<ContactModelRequestsCubit>(() => mockContactModelRequestsCubit);
  });

  tearDown(() async {
    await loginStateController.close();
    await getIt.reset();
  });

  testWidgets('переход со стартового экрана на экран логина', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(StartPage), findsOneWidget);

    await tester.tap(find.text(S.current.LogIn));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('успешный логин переводит со стартового экрана в чаты', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text(S.current.LogIn));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(LoginPage), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password123');
    await tester.pump();

    when(mockLoginCubit.login(any, any)).thenAnswer((_) async {});

    await tester.tap(find.text(S.current.LogIn));
    await tester.pump();

    verify(mockLoginCubit.login('test@example.com', 'password123')).called(1);

    loginStateController.add(const LoginState.loading());
    await tester.pump();

    when(mockUserCubit.state).thenReturn(const UserState(user: _fakeUser, isLoading: false));
    loginStateController.add(const LoginState.loaded());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(LoginPage), findsNothing);
    expect(find.byType(AllChatsPage), findsOneWidget);
  });
}
