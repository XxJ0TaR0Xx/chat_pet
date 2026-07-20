import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/contact_request/contact_requests_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/contacts_page.dart';
import 'package:chat_pet/presentation/pages/contacts/cubit/contacts_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/contact_item.dart';
import 'package:chat_pet/presentation/pages/contacts/widgets/incoming_requests_section.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils/pump_util.dart';
import 'contacts_page_test.mocks.dart';

const _noContacts = <String, List<UserModel>>{};

UserModel _user(String id, String name) => UserModel(id: id, userTag: '@$name', name: name);

ContactRequest _request(String id, String senderName) => ContactRequest(
  id: id,
  sender: _user('sender-$id', senderName),
);

/// В обычном режиме на странице ровно две "живые" (onTap != null) иконки:
/// поиск и добавление контакта. В режиме поиска — стрелка назад и очистка.
/// Такой предикат устойчивее, чем поиск по индексу GestureDetector,
/// т.к. ChatPetIcon.icon оборачивает svg в собственный GestureDetector с onTap == null.
Finder _activeGestureDetectors() =>
    find.byWidgetPredicate((widget) => widget is GestureDetector && widget.onTap != null);

Future<void> _pumpContactsPage(WidgetTester tester) async {
  final router = GoRouter(
    initialLocation: AppRoutes.contacts,
    routes: [
      GoRoute(path: AppRoutes.contacts, builder: (_, __) => const ContactsPage()),
      GoRoute(
        path: AppRoutes.findNewContacts,
        builder: (_, __) => const Scaffold(body: Text('Find New Contacts Page')),
      ),
    ],
  );

  await tester.pumpWidget(pumpUtil(router));
  await tester.pump();
}

@GenerateMocks([ContactsCubit, ContactRequestsCubit])
void main() {
  late MockContactsCubit mockContactsCubit;
  late MockContactRequestsCubit mockContactRequestsCubit;

  setUp(() {
    mockContactsCubit = MockContactsCubit();
    mockContactRequestsCubit = MockContactRequestsCubit();

    when(mockContactsCubit.state).thenReturn(const ContactsState.loading());
    when(mockContactsCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockContactRequestsCubit.state).thenReturn(const ContactRequestState());
    when(mockContactRequestsCubit.stream).thenAnswer((_) => const Stream.empty());

    getIt.registerFactory<ContactsCubit>(() => mockContactsCubit);
    getIt.registerFactory<ContactRequestsCubit>(() => mockContactRequestsCubit);
  });

  tearDown(getIt.reset);

  group('ContactsPage', () {
    group('рендеринг', () {
      testWidgets('отображает страницу без ошибок', (tester) async {
        await _pumpContactsPage(tester);

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(SliverAppBar), findsOneWidget);
      });

      testWidgets('отображает заголовок Contacts', (tester) async {
        await _pumpContactsPage(tester);

        expect(find.text(S.current.Contacts), findsOneWidget);
      });
    });

    group('состояния ContactsCubit', () {
      testWidgets('loading показывает индикатор загрузки', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loading());
        await _pumpContactsPage(tester);

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('loaded с пустым списком показывает заглушку', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        expect(find.text(S.current.FindYourFirstFriends), findsOneWidget);
      });

      testWidgets('loaded с контактами показывает группы по буквам', (tester) async {
        when(mockContactsCubit.state).thenReturn(
          ContactsState.loaded({
            'A': [_user('1', 'Alex')],
            'B': [_user('2', 'Bob')],
          }),
        );
        await _pumpContactsPage(tester);

        expect(find.text('A'), findsOneWidget);
        expect(find.text('B'), findsOneWidget);
        // ContactItem.my() возвращает приватный подкласс _MyContactsItem,
        // поэтому find.byType(ContactItem) не сработает — нужен предикат по `is`.
        expect(find.byWidgetPredicate((widget) => widget is ContactItem), findsNWidgets(2));
        expect(find.text('Alex'), findsOneWidget);
        expect(find.text('Bob'), findsOneWidget);
      });

      testWidgets('error показывает сообщение об ошибке', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.error('Что-то пошло не так'));
        await _pumpContactsPage(tester);

        expect(find.text('Что-то пошло не так'), findsOneWidget);
      });
    });

    group('удаление контакта', () {
      testWidgets('тап по иконке удаления вызывает deleteContact', (tester) async {
        when(mockContactsCubit.state).thenReturn(
          ContactsState.loaded({
            'A': [_user('1', 'Alex')],
          }),
        );
        await _pumpContactsPage(tester);

        await tester.tap(find.byIcon(Icons.delete));
        await tester.pump();

        verify(mockContactsCubit.deleteContact('1')).called(1);
      });
    });

    group('поиск', () {
      testWidgets('тап по иконке поиска открывает строку поиска', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        await tester.tap(_activeGestureDetectors().first);
        await tester.pump();

        expect(find.byType(TextField), findsOneWidget);
      });

      testWidgets('ввод текста вызывает searchContacts', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        await tester.tap(_activeGestureDetectors().first);
        await tester.pump();

        await tester.enterText(find.byType(TextField), 'ale');
        await tester.pump();

        verify(mockContactsCubit.searchContacts('ale')).called(1);
      });

      testWidgets('кнопка "назад" закрывает поиск и сбрасывает фильтр', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        await tester.tap(_activeGestureDetectors().first);
        await tester.pump();

        await tester.tap(_activeGestureDetectors().first);
        await tester.pump();

        expect(find.byType(TextField), findsNothing);
        verify(mockContactsCubit.searchContacts('')).called(1);
      });
    });

    group('добавление контакта', () {
      testWidgets('тап по иконке добавления переходит на экран поиска новых контактов', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        await tester.tap(_activeGestureDetectors().at(1));
        await tester.pumpAndSettle();

        expect(find.text('Find New Contacts Page'), findsOneWidget);
      });
    });

    group('входящие заявки', () {
      testWidgets('без заявок секция не отображается', (tester) async {
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        expect(find.byType(IncomingRequestsSection), findsNothing);
      });

      testWidgets('с заявками секция отображается', (tester) async {
        when(mockContactRequestsCubit.state).thenReturn(ContactRequestState(request: [_request('r1', 'Ivan')]));
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        expect(find.byType(IncomingRequestsSection), findsOneWidget);
        expect(find.text('Ivan'), findsOneWidget);
      });

      testWidgets('тап accept вызывает acceptRequest и обновление контактов', (tester) async {
        when(mockContactRequestsCubit.state).thenReturn(ContactRequestState(request: [_request('r1', 'Ivan')]));
        when(mockContactRequestsCubit.acceptRequest(any)).thenAnswer((_) async {});
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        when(mockContactsCubit.refresh()).thenAnswer((_) async {});
        await _pumpContactsPage(tester);

        await tester.tap(find.byIcon(Icons.check_circle_outline));
        await tester.pumpAndSettle();

        verify(mockContactRequestsCubit.acceptRequest('r1')).called(1);
        verify(mockContactsCubit.refresh()).called(1);
      });

      testWidgets('тап reject вызывает rejectRequest', (tester) async {
        when(mockContactRequestsCubit.state).thenReturn(ContactRequestState(request: [_request('r1', 'Ivan')]));
        when(mockContactRequestsCubit.rejectRequest(any)).thenAnswer((_) async {});
        when(mockContactsCubit.state).thenReturn(const ContactsState.loaded(_noContacts));
        await _pumpContactsPage(tester);

        await tester.tap(find.byIcon(Icons.cancel_outlined));
        await tester.pump();

        verify(mockContactRequestsCubit.rejectRequest('r1')).called(1);
      });
    });
  });
}
