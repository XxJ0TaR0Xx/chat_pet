import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/network/dio_configuration.dart';
import 'package:chat_pet/data/network/interceptors/auth_interceptor.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:dio/dio.dart';

class APIService {
  APIService._(this._dio);

  late final Dio _dio;
  Dio get dio => _dio;

  static late APIService instants;

  static void init() {
    final authInterceptor = AuthInterceptor(
      dio: DioConfiguration.createBasic(baseUrl: ApiConfig.current.baseUrl),
      authServiceProvider: getIt.call<AuthRepository>,
      tokenProvider: getIt<TokenManager>(),
    );

    final dioWithInterceptor = DioConfiguration.createWithAuth(
      baseUrl: ApiConfig.current.baseUrl,
      authInterceptors: [authInterceptor],
    );

    instants = APIService._(dioWithInterceptor);
  }
}
