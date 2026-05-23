import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/data/common/services/dio_configuration.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @injectable
  Dio get dio => DioConfiguration.createBasic(baseUrl: ApiConfig.current.baseUrl);
}
