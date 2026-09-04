import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:dio/dio.dart';

abstract class ChatFailure extends Failure {
  const ChatFailure({required super.message, required super.stackTrace});

  factory ChatFailure.fromDioException(DioException e, StackTrace stackTrace) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return ChatNetworkFailure(stackTrace: stackTrace);
    }

    final statusCode = e.response?.statusCode;

    switch (statusCode) {
      case 401:
        return ChatUnauthorizedFailure(stackTrace: stackTrace);
      case 403:
        return ChatForbiddenFailure(stackTrace: stackTrace);
      case 404:
        return ChatNotFoundFailure(stackTrace: stackTrace);
      case 422:
        return ChatValidationFailure(stackTrace: stackTrace);
      case 500:
      case 502:
      case 503:
        return ChatServerFailure(stackTrace: stackTrace);
      default:
        return ChatUnknownFailure(stackTrace: stackTrace);
    }
  }

  @override
  String get name;
}

// --- Поиск ---

class ChatNotFoundFailure extends ChatFailure {
  const ChatNotFoundFailure({required super.stackTrace}) : super(message: 'Чат не найден');

  @override
  String get name => 'ChatNotFoundFailure';
}

class ChatValidationFailure extends ChatFailure {
  const ChatValidationFailure({required super.stackTrace}) : super(message: 'Проверьте правильность введённых данных');

  @override
  String get name => 'ChatValidationFailure';
}

// --- Доступ ---

class ChatUnauthorizedFailure extends ChatFailure {
  const ChatUnauthorizedFailure({required super.stackTrace}) : super(message: 'Необходима авторизация');

  @override
  String get name => 'ChatUnauthorizedFailure';
}

class ChatForbiddenFailure extends ChatFailure {
  const ChatForbiddenFailure({required super.stackTrace}) : super(message: 'Недостаточно прав');

  @override
  String get name => 'ChatForbiddenFailure';
}

// --- Общие ---

class ChatNetworkFailure extends ChatFailure {
  const ChatNetworkFailure({required super.stackTrace}) : super(message: 'Нет подключения к интернету');

  @override
  String get name => 'ChatNetworkFailure';
}

class ChatServerFailure extends ChatFailure {
  const ChatServerFailure({required super.stackTrace}) : super(message: 'Ошибка сервера, попробуйте позже');

  @override
  String get name => 'ChatServerFailure';
}

class ChatUnknownFailure extends ChatFailure {
  const ChatUnknownFailure({required super.stackTrace}) : super(message: 'Неизвестная ошибка');

  @override
  String get name => 'ChatUnknownFailure';
}
