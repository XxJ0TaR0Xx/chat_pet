import 'dart:convert';

import 'package:chat_pet/domain/interfaces/auth/auth_remote_repository.dart';
import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteRepository)
final class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  const AuthRemoteRepositoryImpl(
    @Named('basicDio') this._dio,
    this._authDio,
  );

  /// Plain Dio, no AuthInterceptor: used for login/refresh, which must
  /// never trigger auth-refresh-and-retry themselves (login doesn't need
  /// auth, and refresh retrying itself on 401 would recurse).
  final Dio _dio;

  /// Dio with AuthInterceptor attached: attaches the access token and
  /// transparently refreshes-and-retries on 401, same as every other
  /// authenticated repository in the app.
  final Dio _authDio;

  static const _authPath = 'auth';

  @override
  Future<Tokens> login(AuthRequest authRequest) async {
    final response = await _dio.post(
      '$_authPath/login',
      data: authRequest.toJson(),
    );

    return Tokens.fromJson(response.data);
  }

  @override
  Future<Tokens> refresh(String refreshToken) async {
    final response = await _dio.post(
      '$_authPath/refresh',
      data: jsonEncode({'refresh_token': refreshToken}),
    );

    return Tokens.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await _authDio.post('$_authPath/logout');
  }
}
