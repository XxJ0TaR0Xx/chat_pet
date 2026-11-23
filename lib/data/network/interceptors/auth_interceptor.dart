import 'package:chat_pet/core/auth/interface/token_provide.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
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
    if (err.response?.statusCode != 401) return handler.reject(err);

    final currentToken = _tokenProvider.accessToken;

    if (currentToken == null) return handler.reject(err);

    final String accessToken;

    if (err.requestOptions.headers[_tokenKey] != _bearer(currentToken)) {
      accessToken = currentToken;
    } else {
      talk.info('Access token expired, attempting refresh');

      try {
        accessToken = await _authServiceProvider().refreshTokens();
      } catch (e, st) {
        talk.error('Token refresh failed, error: $e, stackTrace: $st');
        return handler.reject(err);
      }
    }

    _setToken(err.requestOptions, accessToken);
    talk.info('Retrying request to ${err.requestOptions.path}');

    try {
      return handler.resolve(await _dio.fetch(err.requestOptions));
    } on DioException catch (retryError) {
      return handler.reject(retryError);
    }
  }

  void _setToken(RequestOptions options, String token) {
    options.headers[_tokenKey] = _bearer(token);
  }

  String _bearer(String token) => 'Bearer $token';
}
