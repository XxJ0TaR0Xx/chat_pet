import 'dart:io';

import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
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
        InterceptorsWrapper(
          onError: (error, handler) {
            final request = error.requestOptions;
            talk.error(
              '[HTTP failure] ${request.method} ${request.uri.origin}${request.uri.path}\n'
              'type: ${error.type.name}\n'
              'status: ${error.response?.statusCode ?? 'no response'}\n'
              'message: ${error.message ?? 'not provided'}\n'
              'cause: ${error.error ?? 'not provided'}\n'
              'timeouts: connect=${request.connectTimeout}, '
              'send=${request.sendTimeout}, receive=${request.receiveTimeout}',
            );
            handler.next(error);
          },
        ),
      if (logging)
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestData: false,
            printResponseData: false,
            printErrorData: false,
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseTime: true,
            hiddenHeaders: {'authorization', 'cookie', 'set-cookie'},
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
