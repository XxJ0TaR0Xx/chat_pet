import 'package:chat_pet/core/storages/exceptions/secure_storage_exception.dart';
import 'package:chat_pet/core/storages/failure/secure_storage_failure.dart';
import 'package:chat_pet/data/common/services/web_socket/web_socket_service.dart';
import 'package:chat_pet/data/repositories/auth/auth_repository_impl.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_local_repository.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_remote_repository.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([TokenManager, AuthLocalRepository, AuthRemoteRepository, NotificationWebSocket])
void main() {
  late MockAuthLocalRepository mockAuthLocalRepository;
  late MockAuthRemoteRepository mockAuthRemoteRepository;
  late MockTokenManager mockTokenManager;
  late MockWebSocketService mockWebSocketService;
  late AuthRepository authRepository;

  const tokens = Tokens(accessToken: 'accessToken', refreshToken: 'refreshToken');
  const refreshToken = 'refresh_token';
  const tokensEmpty = Tokens(accessToken: '', refreshToken: '');
  const String emailTest = 'test@email.com';
  const String passwordTest = 'password1234';

  setUp(
    () {
      mockAuthLocalRepository = MockAuthLocalRepository();
      mockAuthRemoteRepository = MockAuthRemoteRepository();
      mockTokenManager = MockTokenManager();
      mockWebSocketService = MockWebSocketService();
      authRepository = AuthRepositoryImpl(
        authLocalRepository: mockAuthLocalRepository,
        authRemoteRepository: mockAuthRemoteRepository,
        tokenCache: mockTokenManager,
        webSocketService: mockWebSocketService,
      );
    },
  );

  group(
    'Init auth repository',
    () {
      test(
        'Init with token',
        () async {
          when(mockAuthLocalRepository.readTokens()).thenAnswer((_) async => tokens);
          when(mockWebSocketService.connect(any)).thenReturn(null);

          await authRepository.init();

          verify(mockAuthLocalRepository.readTokens()).called(1);
          verify(mockTokenManager.updateToken(tokens)).called(1);
          verify(mockWebSocketService.connect(any)).called(1);
        },
      );

      test(
        'Init without token',
        () async {
          when(mockAuthLocalRepository.readTokens()).thenAnswer((_) async => null);

          await authRepository.init();

          verify(mockAuthLocalRepository.readTokens()).called(1);
          verify(mockTokenManager.updateToken(null)).called(1);
          verifyNever(mockWebSocketService.connect(any));
        },
      );
    },
  );

  group('Login', () {
    test(
      'Login susses',
      () async {
        when(mockAuthRemoteRepository.login(any)).thenAnswer((_) async => tokens);
        when(mockWebSocketService.connect(any)).thenReturn(null);

        await authRepository.login(email: emailTest, password: passwordTest);

        verify(mockAuthLocalRepository.writeTokens(tokens)).called(1);
        verify(mockTokenManager.updateToken(tokens)).called(1);
        verify(mockWebSocketService.connect(any)).called(1);
      },
    );

    test(
      'Login error, tokens is empty',
      () async {
        when(mockAuthRemoteRepository.login(any)).thenAnswer((_) async => tokensEmpty);
        when(mockAuthLocalRepository.writeTokens(tokensEmpty)).thenThrow(ArgumentError('Tokens must be not empty'));

        final result = await authRepository.login(email: emailTest, password: passwordTest);

        expect(result.isLeft(), true);
      },
    );

    test(
      'Login error, tokens is null',
      () async {
        when(mockAuthRemoteRepository.login(any)).thenThrow(AuthFailure);

        final result = await authRepository.login(email: emailTest, password: passwordTest);

        expect(result.isLeft(), true);
      },
    );
  });

  group(
    'Logout',
    () {
      test(
        'Logout success',
        () async {
          await authRepository.logout();

          verify(mockAuthRemoteRepository.logout()).called(1);
          verify(mockAuthLocalRepository.removeTokens()).called(1);
          verify(mockWebSocketService.disconnect()).called(1);
          verify(mockTokenManager.clear()).called(1);
        },
      );

      test(
        'Logout dio Exeption',
        () async {
          when(mockAuthRemoteRepository.logout()).thenThrow(DioException(requestOptions: RequestOptions(path: 'auth/logout')));

          expect(() => authRepository.logout(), throwsA(isA<AuthFailure>()));

          verify(mockAuthRemoteRepository.logout()).called(1);
          verifyNever(mockAuthLocalRepository.removeTokens());
          verifyNever(mockWebSocketService.disconnect());
          verifyNever(mockTokenManager.clear());
        },
      );

      test(
        'Logout SecureStorageException',
        () async {
          when(mockAuthRemoteRepository.logout()).thenAnswer((_) async {});
          when(mockAuthLocalRepository.removeTokens()).thenThrow(
            SecureStorageException(operation: 'delete', stackTrace: StackTrace.current),
          );

          await expectLater(
            () => authRepository.logout(),
            throwsA(isA<SecureStorageFailure>()),
          );

          verify(mockAuthRemoteRepository.logout()).called(1);
          verify(mockAuthLocalRepository.removeTokens()).called(1);
          verifyNever(mockWebSocketService.disconnect());
          verifyNever(mockTokenManager.clear());
        },
      );
    },
  );

  group(
    'Refresh',
    () {
      test(
        'Refresh success',
        () async {
          when(mockTokenManager.refreshToken).thenAnswer((_) => refreshToken);
          when(mockAuthRemoteRepository.refresh(any)).thenAnswer((_) async => tokens);

          final assessToken = await authRepository.refreshTokens();

          expect(assessToken, tokens.accessToken);

          verify(mockTokenManager.refreshToken).called(1);
          verify(mockAuthRemoteRepository.refresh(any)).called(1);
          verify(mockAuthLocalRepository.writeTokens(any)).called(1);
          verify(mockTokenManager.updateToken(any)).called(1);
        },
      );

      test(
        'Refresh Dio exeption',
        () async {
          when(mockTokenManager.refreshToken).thenAnswer((_) => refreshToken);
          when(mockAuthRemoteRepository.refresh(any)).thenThrow(
            DioException(requestOptions: RequestOptions(path: 'auth/refresh')),
          );

          await expectLater(
            authRepository.refreshTokens(),
            throwsA(isA<AuthFailure>()),
          );

          verify(mockTokenManager.refreshToken).called(1);
          verify(mockAuthRemoteRepository.refresh(any)).called(3);
          verifyNever(mockAuthLocalRepository.writeTokens(any));
          verifyNever(mockTokenManager.updateToken(any));
        },
      );

      test(
        'Refresh null refresh token',
        () async {
          when(mockTokenManager.refreshToken).thenAnswer((_) => null);

          await expectLater(
            authRepository.refreshTokens(),
            throwsA(isA<UnknownAuthFailure>()),
          );

          verify(mockTokenManager.refreshToken).called(1);
          verifyNever(mockAuthRemoteRepository.refresh(any));
          verifyNever(mockAuthLocalRepository.writeTokens(any));
          verifyNever(mockTokenManager.updateToken(any));
        },
      );

      test(
        'Refresh empty refresh token',
        () async {
          when(mockTokenManager.refreshToken).thenAnswer((_) => '');

          await expectLater(
            authRepository.refreshTokens(),
            throwsA(isA<UnknownAuthFailure>()),
          );

          verify(mockTokenManager.refreshToken).called(1);
          verifyNever(mockAuthRemoteRepository.refresh(any));
          verifyNever(mockAuthLocalRepository.writeTokens(any));
          verifyNever(mockTokenManager.updateToken(any));
        },
      );

      test(
        'Refresh SecureStorageException',
        () async {
          when(mockTokenManager.refreshToken).thenAnswer((_) => refreshToken);
          when(mockAuthRemoteRepository.refresh(any)).thenAnswer((_) async => tokens);
          when(mockAuthLocalRepository.writeTokens(any)).thenThrow(
            SecureStorageException(operation: 'write', stackTrace: StackTrace.current),
          );

          await expectLater(
            authRepository.refreshTokens(),
            throwsA(isA<SecureStorageFailure>()),
          );

          verify(mockTokenManager.refreshToken).called(1);
          verify(mockAuthRemoteRepository.refresh(any)).called(3);
          verify(mockAuthLocalRepository.writeTokens(any)).called(3);
          verifyNever(mockTokenManager.updateToken(any));
        },
      );
    },
  );
}
