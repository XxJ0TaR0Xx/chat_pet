import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

abstract class DioConfiguration {
  static Dio _createDioInstance({
    required String baseUrl,
    Iterable<Interceptor>? interceptors,
    Duration? timeout,
    bool logging = true,
  }) {
    final timeout0 = timeout ?? const Duration(seconds: 10);

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: timeout0,
        connectTimeout: timeout0,
        receiveTimeout: timeout0,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      if (interceptors != null) ...interceptors,
      if (logging)
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
    ]);

    return dio;
  }

  static Dio createWithAuth({
    required String baseUrl,
    required Iterable<Interceptor> authInterceptors,
    Duration? timeout,
  }) {
    return _createDioInstance(
      baseUrl: baseUrl,
      interceptors: authInterceptors,
      timeout: timeout,
    );
  }

  static Dio createBasic({required String baseUrl, Duration? timeout, bool logging = true}) {
    return _createDioInstance(baseUrl: baseUrl, timeout: timeout, logging: logging);
  }
}
