import 'dart:async';

import 'package:chat_pet/data/common/services/web_socket/web_socket_service.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/data/repositories/contacts/contacts_repository_impl.dart';
import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_repository_test.mocks.dart';

@GenerateMocks([Dio, NotificationWebSocket])
void main() {
  late ContactsRepository contactsRepository;
  late MockDio mockDio;
  late MockWebSocketService mockWebSocketService;

  const requestId = 'requestId1234';

  final userModel = UserModel(
    id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
    name: 'string',
    userTag: 'string',
    avatarUrl: 'string',
    createdAt: DateTime.tryParse('2026-06-19T16:37:10.127Z'),
  );

  setUp(
    () {
      mockDio = MockDio();
      mockWebSocketService = MockWebSocketService();
      contactsRepository = ContactsRepositoryImpl(mockDio, mockWebSocketService);
    },
  );

  group(
    'Get contacts',
    () {
      const contactsPath = 'contacts/';
      final requestOptions = RequestOptions(path: contactsPath);

      const List<dynamic> contactsResponse = [
        {
          "user": {
            "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            "username": "string",
            "user_tag": "string",
            "avatar_url": "string",
            "is_active": true,
            "created_at": "2026-06-19T16:37:10.127Z",
          },
          "since": "2026-06-19T16:37:10.127Z",
        },
      ];

      test(
        'Get contacts: success',
        () async {
          when(mockDio.get(contactsPath)).thenAnswer(
            (_) async => Response(
              data: contactsResponse,
              requestOptions: requestOptions,
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isRight(), isTrue);

          final contacts = result.getOrElse((_) => []);
          expect(contacts, [userModel]);

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: return empty ',
        () async {
          when(mockDio.get(contactsPath)).thenAnswer(
            (_) async => Response(
              data: [],
              requestOptions: requestOptions,
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isRight(), isTrue);

          final contacts = result.getOrElse((_) => []);
          expect(contacts, []);

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: dio exeption',
        () async {
          when(mockDio.get(contactsPath)).thenThrow(
            DioException(requestOptions: requestOptions),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsFailure>()),
            (r) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: 401 -> ContactsUnauthorizedFailure',
        () async {
          when(mockDio.get(contactsPath)).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(
                statusCode: 401,
                requestOptions: requestOptions,
              ),
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsUnauthorizedFailure>()),
            (r) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: 403 -> ContactsForbiddenFailure',
        () async {
          when(mockDio.get(contactsPath)).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(
                statusCode: 403,
                requestOptions: requestOptions,
              ),
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsForbiddenFailure>()),
            (r) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: 404 -> ContactsNotFounded',
        () async {
          when(mockDio.get(contactsPath)).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(
                statusCode: 404,
                requestOptions: requestOptions,
              ),
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsNotFoundFailure>()),
            (r) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(contactsPath)).called(1);
        },
      );

      test(
        'Get contacts: 500 -> ContactsServerFailure',
        () async {
          when(mockDio.get(contactsPath)).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(
                statusCode: 500,
                requestOptions: requestOptions,
              ),
            ),
          );

          final result = await contactsRepository.getContacts();
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsServerFailure>()),
            (r) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(contactsPath)).called(1);
        },
      );
    },
  );

  group(
    'Search contact',
    () {
      const searchPath = 'contacts/request/';
      final requestOptions = RequestOptions(path: searchPath);

      const List<dynamic> searchContactsResponse = [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "username": "string",
          "user_tag": "string",
          "avatar_url": "string",
          "is_active": true,
          "created_at": "2026-06-19T16:37:10.127Z",
        },
      ];

      test(
        'Search contact: success',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenAnswer(
            (t) async => Response(
              requestOptions: requestOptions,
              data: searchContactsResponse,
            ),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isRight(), isTrue);

          final contacts = result.getOrElse((_) => []);
          expect(contacts, [userModel]);

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );

      test(
        'Search contact: success empty query',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': ''})).thenAnswer(
            (t) async => Response(
              requestOptions: requestOptions,
              data: [],
            ),
          );

          final result = await contactsRepository.searchContacts('');
          expect(result.isRight(), isTrue);

          final contacts = result.getOrElse((_) => []);
          expect(contacts, []);

          verify(mockDio.get(searchPath, queryParameters: {'q': ''})).called(1);
        },
      );

      test(
        'Search contact: dio exeption',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenThrow(
            DioException(requestOptions: requestOptions),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );

      test(
        'Search contact: dio exeption 401 -> ContactsUnknownFailure',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(requestOptions: requestOptions, statusCode: 401),
            ),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsUnauthorizedFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );

      test(
        'Search contact: dio exeption 403 -> ContactsForbiddenFailure',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(requestOptions: requestOptions, statusCode: 403),
            ),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsForbiddenFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );

      test(
        'Search contact: dio exeption 404 -> ContactsNotFoundFailure',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(requestOptions: requestOptions, statusCode: 404),
            ),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsNotFoundFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );

      test(
        'Search contact: dio exeption 500 -> ContactsServerFailure',
        () async {
          when(mockDio.get(searchPath, queryParameters: {'q': 'string'})).thenThrow(
            DioException(
              requestOptions: requestOptions,
              response: Response(requestOptions: requestOptions, statusCode: 500),
            ),
          );

          final result = await contactsRepository.searchContacts('string');
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsServerFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.get(searchPath, queryParameters: {'q': 'string'})).called(1);
        },
      );
    },
  );

  group(
    'Send request',
    () {
      const userId = '3fa85f64-5717-4562-b3fc-2c963f66afa6';
      const sendRequestPath = 'contacts/request';

      test(
        'Send request: success',
        () async {
          when(mockDio.post('$sendRequestPath/$userId')).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(
                path: '$sendRequestPath/$userId',
              ),
            ),
          );

          final result = await contactsRepository.sendRequest(userId);

          expect(result.isRight(), isTrue);

          verify(mockDio.post('$sendRequestPath/$userId')).called(1);
        },
      );

      test(
        'Send request: success emptyId',
        () async {
          when(mockDio.post('$sendRequestPath/')).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(
                path: '$sendRequestPath/',
              ),
            ),
          );

          final result = await contactsRepository.sendRequest('');

          expect(result.isRight(), isTrue);

          verify(mockDio.post('$sendRequestPath/')).called(1);
        },
      );

      test(
        'Send request: dio exeption',
        () async {
          when(mockDio.post('$sendRequestPath/$userId')).thenThrow(
            DioException(requestOptions: RequestOptions(path: '$sendRequestPath/$userId')),
          );

          final result = await contactsRepository.sendRequest(userId);
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsFailure>()),
            (_) => fail('Expected but got Right'),
          );

          verify(mockDio.post('$sendRequestPath/$userId')).called(1);
        },
      );

      test(
        'Send request: dio exeption 505 -> ContactsUnknownFailure',
        () async {
          when(mockDio.post('$sendRequestPath/$userId')).thenThrow(
            DioException(
              requestOptions: RequestOptions(
                path: '$sendRequestPath/$userId',
                data: Response(
                  requestOptions: RequestOptions(path: '$sendRequestPath/$userId'),
                  statusCode: 505,
                ),
              ),
            ),
          );

          final result = await contactsRepository.sendRequest(userId);
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsUnknownFailure>()),
            (_) => fail('Expected but got Right'),
          );

          verify(mockDio.post('$sendRequestPath/$userId')).called(1);
        },
      );
    },
  );

  group(
    'Accept Request',
    () {
      const acceptRequestResponse = {
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "sender": {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "username": "string",
          "user_tag": "string",
          "avatar_url": "string",
          "is_active": true,
          "created_at": "2026-06-19T16:37:10.127Z",
        },
        "receiver": {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "username": "string",
          "user_tag": "string",
          "avatar_url": "string",
          "is_active": true,
          "created_at": "2026-06-19T16:37:10.127Z",
        },
        "status": "pending",
        "created_at": "2026-06-19T16:37:10.127Z",
      };

      String acceptRequestPath(String requestId) => 'contacts/requests/$requestId/accept';

      test(
        'Accept Request: success',
        () async {
          final path = acceptRequestPath(requestId);

          when(mockDio.post(path)).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: path),
              data: acceptRequestResponse,
            ),
          );

          final result = await contactsRepository.acceptRequest(requestId);
          expect(result.isRight(), isTrue);

          final contact = result.getOrElse((_) => const UserModel(id: '', userTag: ''));
          expect(contact, userModel);

          verify(mockDio.post(path)).called(1);
        },
      );

      test(
        'Accept Request: Dio Exeption',
        () async {
          final path = acceptRequestPath(requestId);

          when(mockDio.post(path)).thenThrow(
            DioException(requestOptions: RequestOptions(path: path)),
          );

          final result = await contactsRepository.acceptRequest(requestId);
          expect(result.isLeft(), isTrue);

          result.fold(
            (failure) => expect(failure, isA<ContactsFailure>()),
            (_) => fail('Expected Left but got Right'),
          );

          verify(mockDio.post(path)).called(1);
        },
      );
    },
  );

  group('Reject request', () {
    String rejectRequestPath = 'contacts/requests/$requestId/reject';

    test('Reject request: Success', () async {
      when(mockDio.post(rejectRequestPath)).thenAnswer((_) async {
        return Response(requestOptions: RequestOptions(path: rejectRequestPath));
      });

      final result = await contactsRepository.rejectRequest(requestId);

      expect(result.isRight(), isTrue);

      verify(mockDio.post(rejectRequestPath)).called(1);
    });

    test('Reject request: Dio exeption', () async {
      when(mockDio.post(rejectRequestPath)).thenThrow(DioException(requestOptions: RequestOptions(path: rejectRequestPath)));

      final result = await contactsRepository.rejectRequest(requestId);

      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<ContactsFailure>()),
        (_) => fail('Expected Left but got Right'),
      );

      verify(mockDio.post(rejectRequestPath)).called(1);
    });
  });

  group('Delete contact', () {
    const contactId = 'contactId';
    String deleteContactPath = 'contacts/$contactId';

    test('Delete contact: Success', () async {
      when(mockDio.delete(deleteContactPath)).thenAnswer((_) async {
        return Response(requestOptions: RequestOptions(path: deleteContactPath));
      });

      final result = await contactsRepository.deleteContacts(contactId);

      expect(result.isRight(), isTrue);

      verify(mockDio.delete(deleteContactPath)).called(1);
    });

    test('Delete contact: Dio exeption', () async {
      when(mockDio.delete(deleteContactPath)).thenThrow(DioException(requestOptions: RequestOptions(path: deleteContactPath)));

      final result = await contactsRepository.deleteContacts(contactId);

      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<ContactsFailure>()),
        (_) => fail('Expected Left but got Right'),
      );

      verify(mockDio.delete(deleteContactPath)).called(1);
    });
  });

  group('Incoming request', () {
    String incomingRequestPath = 'contacts/requests/incoming';

    const incomingRequestData = [
      {
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "sender": {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "username": "string",
          "user_tag": "string",
          "avatar_url": "string",
          "is_active": true,
          "created_at": "2026-06-22T12:58:30.460Z",
        },
        "receiver": {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "username": "string",
          "user_tag": "string",
          "avatar_url": "string",
          "is_active": true,
          "created_at": "2026-06-22T12:58:30.460Z",
        },
        "status": "pending",
        "created_at": "2026-06-22T12:58:30.460Z",
      },
    ];

    final ContactModelRequest = ContactModelRequest(
      id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      sender: UserModel(
        id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'string',
        userTag: 'string',
        avatarUrl: 'string',
        createdAt: DateTime.tryParse('2026-06-22T12:58:30.460Z'),
      ),
      receiver: UserModel(
        id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'string',
        userTag: 'string',
        avatarUrl: 'string',
        createdAt: DateTime.tryParse('2026-06-22T12:58:30.460Z'),
      ),
    );

    test('Incoming request: Success', () async {
      when(mockDio.get(incomingRequestPath)).thenAnswer((_) async {
        return Response(
          data: incomingRequestData,
          requestOptions: RequestOptions(path: incomingRequestPath),
        );
      });

      final result = await contactsRepository.incomingRequest();

      expect(result.isRight(), isTrue);

      final incomingRequests = result.getOrElse((_) => []);
      expect(incomingRequests, [ContactModelRequest]);

      verify(mockDio.get(incomingRequestPath)).called(1);
    });

    test('Incoming request: Success (Empty request) ', () async {
      when(mockDio.get(incomingRequestPath)).thenAnswer((_) async {
        return Response(
          data: [],
          requestOptions: RequestOptions(path: incomingRequestPath),
        );
      });

      final result = await contactsRepository.incomingRequest();

      expect(result.isRight(), isTrue);

      final incomingRequests = result.getOrElse((_) => []);
      expect(incomingRequests, []);

      verify(mockDio.get(incomingRequestPath)).called(1);
    });

    test('Incoming request: Dio exeption', () async {
      when(mockDio.get(incomingRequestPath)).thenThrow(DioException(requestOptions: RequestOptions(path: incomingRequestPath)));

      final result = await contactsRepository.incomingRequest();

      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<ContactsFailure>()),
        (_) => fail('Expected Left but got Right'),
      );

      verify(mockDio.get(incomingRequestPath)).called(1);
    });
  });

  group(
    'Incoming request stream',
    () {
      late StreamController<Map<String, dynamic>> wsController;

      final friendRequestEvent = {
        'type': 'friend_request',
        'id': 'request-id',
        'sender': {
          'id': 'user-id',
          'user_tag': 'userTag',
        },
      };

      setUp(
        () {
          wsController = StreamController<Map<String, dynamic>>.broadcast();
          when(mockWebSocketService.stream).thenAnswer((_) => wsController.stream);
        },
      );

      tearDown(() => wsController.close());

      test(
        'Incoming request: Success',
        () async {
          final future = expectLater(
            contactsRepository.incomingRequestStream,
            emits(isA<ContactModelRequest>()),
          );

          wsController.add(friendRequestEvent);

          await future;
        },
      );

      test('Dont throw event with another type', () async {
        final List<ContactModelRequest> received = [];
        final sub = contactsRepository.incomingRequestStream.listen(received.add);

        wsController.add({'type': 'other_event', 'data': 'anything'});

        await Future.delayed(Duration.zero);

        expect(received, isEmpty);
        await sub.cancel();
      });

      test('Dont throw event without type', () async {
        final List<ContactModelRequest> received = [];
        final sub = contactsRepository.incomingRequestStream.listen(received.add);

        wsController.add({'data': 'anything'});

        await Future.delayed(Duration.zero);

        expect(received, isEmpty);
        await sub.cancel();
      });
    },
  );
}
