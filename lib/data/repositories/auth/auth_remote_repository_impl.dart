import 'dart:convert';

import 'package:chat_pet/domain/interfaces/auth/auth_remote_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/auth/auth_request.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteRepository)
final class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  AuthRemoteRepositoryImpl(this._dio, this._tokenManager);

  final Dio _dio;
  final TokenManager _tokenManager;

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
    final token = _tokenManager.accessToken;
    await _dio.post(
      '$_authPath/logout',
      options: token != null
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null,
    );
  }
}