import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/common/services/dio_configuration.dart';
import 'package:chat_pet/data/repositories/interceptors/auth_interceptor.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class APIService {
  APIService._(this._dio);

  late final Dio _dio;
  Dio get dio => _dio;

  static late APIService instants;

  static void init() {
    final authInterceptor = AuthInterceptor(
      dio: DioConfiguration.createBasic(baseUrl: ApiConfig.current.baseUrl),
      authService: getIt<AuthRepository>(),
      tokenProvider: getIt<TokenManager>(),
    );

    final dioTalker = TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    );

    final dioWithInterceptor = DioConfiguration.createWithAuth(
      baseUrl: ApiConfig.current.baseUrl,
      authInterceptors: [authInterceptor, dioTalker],
    );

    instants = APIService._(dioWithInterceptor);
  }
}
