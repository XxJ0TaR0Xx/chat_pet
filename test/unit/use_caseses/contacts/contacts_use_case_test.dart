import 'dart:async';

import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/contacts/accept_request_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/delete_contact_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/get_contacts_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_request_stream_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_requests_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/reject_request_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/search_contacts_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/send_request_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_use_case_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  const userModel = UserModel(id: 'id', userTag: 'userTag');
  provideDummy<Either<ContactsFailure, UserModel>>(const Right(userModel));
  provideDummy<Either<ContactsFailure, Unit>>(const Right(unit));
  provideDummy<Either<ContactsFailure, List<UserModel>>>(const Right([]));
  provideDummy<Either<ContactsFailure, List<ContactModelRequest>>>(const Right([]));

  late MockContactsRepository mockContactsRepository;

  setUp(() {
    mockContactsRepository = MockContactsRepository();
  });

  group('Accept Request Use Case', () {
    late AcceptRequestUseCase acceptRequestUseCase;

    const requestId = 'requestId';

    setUp(() => acceptRequestUseCase = AcceptRequestUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.acceptRequest(requestId)).thenAnswer((_) async => const Right(userModel));

        final result = await acceptRequestUseCase.call(requestId: requestId);
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.acceptRequest(requestId)).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.acceptRequest(requestId)).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await acceptRequestUseCase.call(requestId: requestId);
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.acceptRequest(requestId)).called(1);
      },
    );

    test(
      'Error: empty requestId',
      () async {
        final result = await acceptRequestUseCase.call(requestId: '');
        expect(result.isLeft(), isTrue);

        verifyNever(mockContactsRepository.acceptRequest(any));
      },
    );
  });

  group('Accept Request Use Case', () {
    late DeleteContactUseCase deleteContactUseCase;

    const contactId = 'contactId';

    setUp(() => deleteContactUseCase = DeleteContactUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.deleteContacts(contactId)).thenAnswer((_) async => const Right(unit));

        final result = await deleteContactUseCase.call(contactId: contactId);
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.deleteContacts(contactId)).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.deleteContacts(contactId)).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await deleteContactUseCase.call(contactId: contactId);
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.deleteContacts(contactId)).called(1);
      },
    );

    test(
      'Error: empty contactId',
      () async {
        final result = await deleteContactUseCase.call(contactId: '');
        expect(result.isLeft(), isTrue);

        verifyNever(mockContactsRepository.deleteContacts(any));
      },
    );
  });

  group('Get Contacts Use Case', () {
    late GetContactsUseCase getContactsUseCase;

    setUp(() => getContactsUseCase = GetContactsUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.getContacts()).thenAnswer((_) async => const Right([]));

        final result = await getContactsUseCase.call();
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.getContacts()).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.getContacts()).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await getContactsUseCase.call();
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.getContacts()).called(1);
      },
    );
  });

  group('Get Contacts Use Case', () {
    late IncomingRequestStreamUseCase incomingRequestStreamUseCase;
    late StreamController<ContactModelRequest> controller;

    setUp(() {
      incomingRequestStreamUseCase = IncomingRequestStreamUseCase(mockContactsRepository);
      controller = StreamController<ContactModelRequest>.broadcast();
      when(mockContactsRepository.incomingRequestStream).thenAnswer((_) => controller.stream);
    });

    tearDown(() => controller.close());

    test(
      'Success: returned stream from repo',
      () async {
        const tRequest = ContactModelRequest(
          id: 'id',
          sender: UserModel(id: 'id', userTag: 'userTag'),
        );

        final future = expectLater(incomingRequestStreamUseCase(), emits(tRequest));

        controller.add(tRequest);

        await future;
      },
    );

    test(
      'Success: equals streams',
      () async {
        final result = incomingRequestStreamUseCase();
        expect(result, equals(controller.stream));
      },
    );
  });

  group('Incoming Requests Use Case', () {
    late IncomingRequestsUseCase incomingRequestsUseCase;

    setUp(() => incomingRequestsUseCase = IncomingRequestsUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.incomingRequest()).thenAnswer((_) async => const Right([]));

        final result = await incomingRequestsUseCase.call();
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.incomingRequest()).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.incomingRequest()).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await incomingRequestsUseCase.call();
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.incomingRequest()).called(1);
      },
    );
  });

  group('Reject Request Use Case', () {
    late RejectRequestUseCase rejectRequestUseCase;

    const requestId = 'requestId';

    setUp(() => rejectRequestUseCase = RejectRequestUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.rejectRequest(requestId)).thenAnswer((_) async => const Right(unit));

        final result = await rejectRequestUseCase.call(requestId: requestId);
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.rejectRequest(requestId)).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.rejectRequest(requestId)).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await rejectRequestUseCase.call(requestId: requestId);
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.rejectRequest(requestId)).called(1);
      },
    );

    test(
      'Error: empty rejectId',
      () async {
        final result = await rejectRequestUseCase.call(requestId: '');
        expect(result.isLeft(), isTrue);

        verifyNever(mockContactsRepository.rejectRequest(any));
      },
    );
  });

  group('Search Contacts Use Case', () {
    late SearchContactsUseCase searchContactsUseCase;

    const q = 'q';

    setUp(() => searchContactsUseCase = SearchContactsUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.searchContacts(q)).thenAnswer((_) async => const Right([userModel]));

        final result = await searchContactsUseCase.call(userTag: q);
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.searchContacts(q)).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.searchContacts(q)).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await searchContactsUseCase.call(userTag: q);
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.searchContacts(q)).called(1);
      },
    );
  });

  group('Send Request Use Case', () {
    late SendRequestUseCase sendRequestUseCase;

    const userId = 'userId';

    setUp(() => sendRequestUseCase = SendRequestUseCase(mockContactsRepository));

    test(
      'Success',
      () async {
        when(mockContactsRepository.sendRequest(userId)).thenAnswer((_) async => const Right(unit));

        final result = await sendRequestUseCase.call(userId: userId);
        expect(result.isRight(), isTrue);

        verify(mockContactsRepository.sendRequest(userId)).called(1);
      },
    );

    test(
      'Error: from repository',
      () async {
        when(mockContactsRepository.sendRequest(userId)).thenAnswer((_) async => Left(ContactsUnknownFailure(stackTrace: StackTrace.current)));

        final result = await sendRequestUseCase.call(userId: userId);
        expect(result.isLeft(), isTrue);

        verify(mockContactsRepository.sendRequest(userId)).called(1);
      },
    );

    test(
      'Error: empty userId',
      () async {
        final result = await sendRequestUseCase.call(userId: '');
        expect(result.isLeft(), isTrue);

        verifyNever(mockContactsRepository.sendRequest(any));
      },
    );
  });
}
