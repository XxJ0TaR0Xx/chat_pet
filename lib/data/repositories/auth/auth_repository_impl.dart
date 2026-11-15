import 'dart:async';

import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/core/storages/exceptions/secure_storage_exception.dart';
import 'package:chat_pet/core/utils/exceptions_handler/secure_storage_exception_extension.dart';
import 'package:chat_pet/core/utils/retry/retry_util.dart';
import 'package:chat_pet/data/common/services/web_socket/notification_web_socket.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_local_repository.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_remote_repository.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalRepository authLocalRepository,
    required AuthRemoteRepository authRemoteRepository,
    required TokenManager tokenCache,
    required NotificationWebSocket webSocketService,
  }) : _authLocalRepository = authLocalRepository,
       _authRemoteRepository = authRemoteRepository,
       _tokenCache = tokenCache,
       _webSocketService = webSocketService;

  final AuthLocalRepository _authLocalRepository;
  final AuthRemoteRepository _authRemoteRepository;
  final TokenManager _tokenCache;
  final NotificationWebSocket _webSocketService;

  Future<String>? _refreshFuture;

  @override
  Stream<bool> get isAuthorized => _tokenCache.isAuthorized;

  @override
  FutureOr<void> init() async {
    talk.info('initialization started');

    try {
      final tokens = await _authLocalRepository.readTokens();

      _tokenCache.updateToken(tokens);

      if (tokens != null) {
        _connectWebSocketService();
      }

      talk.info('initialized successfully');
    } on SecureStorageException catch (e, st) {
      throw e.toFailure(st);
    } catch (e, st) {
      talk.error('init error: $e, st $st');
      throw UnknownAuthFailure(stackTrace: st);
    }
  }

  @override
  Future<Either<AuthFailure, void>> login({required String email, required String password}) async {
    talk.info('Login requested');

    try {
      final tokens = await _authRemoteRepository.login(AuthRequest(email: email, password: password));

      await _authLocalRepository.writeTokens(tokens);

      _tokenCache.updateToken(tokens);

      _connectWebSocketService();

      talk.info('Login successful');
      return const Right(null);
    } on DioException catch (e, st) {
      return Left(AuthFailure.fromDioException(e, st));
    } on SecureStorageException catch (e, st) {
      throw e.toFailure(st);
    } catch (e, st) {
      talk.error('Login error: $e, st $st');
      return Left(UnknownAuthFailure(stackTrace: st));
    }
  }

  @override
  Future<void> logout() async {
    talk.info('Logout requested');

    try {
      await _authRemoteRepository.logout();
    } catch (e, st) {
      talk.warning('Remote logout failed, proceeding with local cleanup: $e, st $st');
    }

    try {
      await _terminateLocalSession();
    } on SecureStorageException catch (e, st) {
      throw e.toFailure(st);
    } catch (e, st) {
      talk.error('Logout error: $e, st $st');
      throw UnknownAuthFailure(stackTrace: st);
    }
  }

  @override
  Future<String> refreshTokens() => _refreshFuture ??= _refreshTokens().whenComplete(() => _refreshFuture = null);

  Future<String> _refreshTokens() async {
    talk.info('Tokens refresh started');

    try {
      final refreshToken = _tokenCache.refreshToken;

      if (refreshToken == null || refreshToken.isEmpty) throw SessionExpiredFailure(stackTrace: StackTrace.current);

      final accessToken = await RetryUtil.run<String>(
        maxAttempts: 3,
        retryIf: (error, st) => error is! DioException || _mapRefreshError(error, st) is! SessionExpiredFailure,
        action: () async {
          final newTokens = await _authRemoteRepository.refresh(refreshToken);

          await _authLocalRepository.writeTokens(newTokens);

          _tokenCache.updateToken(newTokens);

          return newTokens.accessToken;
        },
      );

      talk.info('Token refresh successful');

      return accessToken;
    } on AuthFailure catch (failure) {
      await _onRefreshFailed(failure);
      rethrow;
    } on DioException catch (e, st) {
      final failure = _mapRefreshError(e, st);
      await _onRefreshFailed(failure);
      throw failure;
    } on SecureStorageException catch (e, st) {
      throw e.toFailure(st);
    } catch (e, st) {
      talk.error('Token refresh error: $e, st $st');
      throw UnknownAuthFailure(stackTrace: st);
    }
  }

  AuthFailure _mapRefreshError(DioException e, StackTrace st) {
    if (e.response?.statusCode == 401) return SessionExpiredFailure(stackTrace: st);
    return AuthFailure.fromDioException(e, st);
  }

  Future<void> _onRefreshFailed(AuthFailure failure) async {
    if (failure is! SessionExpiredFailure) return;

    talk.warning('Session expired, terminating local session');

    try {
      await _terminateLocalSession();
    } catch (e, st) {
      talk.error('Local session cleanup failed: $e, st $st');
    }
  }

  Future<void> _terminateLocalSession() async {
    _tokenCache.clear();
    _webSocketService.disconnect();
    await _authLocalRepository.removeTokens();
  }

  void _connectWebSocketService() {
    final wsUrl = '${ApiConfig.current.wsUrl}contacts/ws/notifications';
    _webSocketService.connect(wsUrl);
  }
}
