import 'package:chat_pet/data/repositories/registration/registration_repository_impl.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/registration/registration_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'registration_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RegistrationRepository registrationRepository;

  const registrationPath = 'auth/register';

  const userName = 'userName';
  const email = 'email';
  const password = 'password';

  const registrationData = {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "username": "string",
    "user_tag": "string",
    "avatar_url": "string",
    "is_active": true,
    "created_at": "2026-06-22T13:29:38.622Z",
  };

  final userModel = UserModel(
    id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
    name: 'string',
    userTag: 'string',
    avatarUrl: 'string',
    createdAt: DateTime.tryParse('2026-06-22T13:29:38.622Z'),
  );

  final requestOptions = RequestOptions(path: registrationPath);

  setUp(
    () {
      mockDio = MockDio();
      registrationRepository = RegistrationRepositoryImpl(mockDio);
    },
  );

  group('Registration', () {
    test('Registration: success', () async {
      when(
        mockDio.post(
          registrationPath,
          data: {
            'username': userName,
            'email': email,
            'password': password,
          },
        ),
      ).thenAnswer(
        (_) async => Response(
          data: registrationData,
          requestOptions: requestOptions,
        ),
      );

      final result = await registrationRepository.registration(userName, email, password);
      expect(result.isRight(), isTrue);

      final user = result.getOrElse((_) => const UserModel(id: '', userTag: ''));
      expect(user, userModel);

      verify(
        mockDio.post(
          registrationPath,
          data: {
            'username': userName,
            'email': email,
            'password': password,
          },
        ),
      ).called(1);
    });

    test('Registration: error (Dio exeption)', () async {
      when(
        mockDio.post(
          registrationPath,
          data: {
            'username': userName,
            'email': email,
            'password': password,
          },
        ),
      ).thenThrow(DioException(requestOptions: requestOptions));

      final result = await registrationRepository.registration(userName, email, password);
      expect(result.isLeft(), isTrue);

      result.fold(
        (failure) => expect(failure, isA<AuthFailure>()),
        (_) => fail('Expected Left, but got Right'),
      );

      verify(
        mockDio.post(
          registrationPath,
          data: {
            'username': userName,
            'email': email,
            'password': password,
          },
        ),
      ).called(1);
    });
  });
}
