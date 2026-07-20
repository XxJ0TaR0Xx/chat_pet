import 'dart:developer';

import 'package:chat_pet/core/auth/interface/token_provide.dart';
import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor({
    required Dio dio,
    required TokenProvider tokenProvider,
    required AuthRepository Function() authServiceProvider,
  }) : _dio = dio,
       _tokenProvider = tokenProvider,
       _authServiceProvider = authServiceProvider;

  static const _tokenKey = 'Authorization';

  final Dio _dio;
  final TokenProvider _tokenProvider;
  final AuthRepository Function() _authServiceProvider;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log('_tokenProvider.accessToken ${_tokenProvider.accessToken}');

    if (_tokenProvider.accessToken case final accessToken?) {
      _setToken(options, accessToken);

      handler.next(options);
    } else {
      talk.warning('No access token available, rejecting request to ${options.path}');

      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
        ),
      );
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      talk.info('Access token expired, attempting refresh');

      try {
        final newAccessToken = await _authServiceProvider().refreshTokens();

        _setToken(err.requestOptions, newAccessToken);

        talk.info('Toke refresher, retrying request to ${err.requestOptions.path}');

        return handler.resolve(await _dio.fetch(err.requestOptions));
      } catch (e, st) {
        talk.error('Token refresh failed, error: $e, stackTrace: $st');

        handler.reject(err);
      }
    }
    handler.reject(err);
  }

  void _setToken(RequestOptions options, String token) {
    options.headers[_tokenKey] = 'Bearer $token';
  }
}
