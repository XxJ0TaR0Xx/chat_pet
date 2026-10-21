import 'package:chat_pet/data/repositories/auth/auth_remote_repository_impl.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_remote_repository.dart';
import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late MockDio mockAuthDio;
  late AuthRemoteRepository authRemoteRepository;

  const tRequest = AuthRequest(email: 'test@test.com', password: 'password123');
  const tTokens = Tokens(accessToken: 'accessToken', refreshToken: 'refreshToken');
  final tTokensJson = {'access_token': 'accessToken', 'refresh_token': 'refreshToken'};

  setUp(() {
    mockDio = MockDio();
    mockAuthDio = MockDio();
    authRemoteRepository = AuthRemoteRepositoryImpl(mockDio, mockAuthDio);
  });

  group('login', () {
    test('возвращает Tokens при успешном ответе', () async {
      when(mockDio.post('auth/login', data: anyNamed('data'))).thenAnswer(
        (_) async => Response(
          data: tTokensJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'auth/login'),
        ),
      );

      final result = await authRemoteRepository.login(tRequest);

      expect(result, tTokens);
      verify(mockDio.post('auth/login', data: tRequest.toJson())).called(1);
    });

    test('пробрасывает DioException при ошибке сети', () async {
      when(mockDio.post('auth/login', data: anyNamed('data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: 'auth/login'),
          type: DioExceptionType.connectionError,
        ),
      );

      expect(
        () => authRemoteRepository.login(tRequest),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('refresh', () {
    test('возвращает новые Tokens при успешном ответе', () async {
      when(mockDio.post('auth/refresh', data: anyNamed('data'))).thenAnswer(
        (_) async => Response(
          data: tTokensJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'auth/refresh'),
        ),
      );

      final result = await authRemoteRepository.refresh('oldRefreshToken');

      expect(result, tTokens);
    });
  });

  group('logout', () {
    test('отправляет запрос через authDio (с интерцептором авторизации)', () async {
      when(mockAuthDio.post('auth/logout')).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: 'auth/logout'),
        ),
      );

      await authRemoteRepository.logout();

      verify(mockAuthDio.post('auth/logout')).called(1);
      verifyNever(mockDio.post(any));
    });
  });
}
