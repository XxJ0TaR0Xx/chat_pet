import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:dio/dio.dart';

abstract class UserFailure extends Failure {
  const UserFailure({required super.message, required super.stackTrace});

  factory UserFailure.fromDioException(DioException e, StackTrace stackTrace) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionError) {
      return UserNetworkFailure(stackTrace: stackTrace);
    }

    final statusCode = e.response?.statusCode;
    final detail = e.response?.data?['detail'] as String?;

    switch (statusCode) {
      case 400:
        if (detail == 'Email already registered') {
          return UserEmailTakenFailure(stackTrace: stackTrace);
        }
        if (detail?.contains('Invalid file type') == true) {
          return UserInvalidFileTypeFailure(stackTrace: stackTrace);
        }
        if (detail?.contains('File too large') == true) {
          return UserFileTooLargeFailure(stackTrace: stackTrace);
        }
        return UserUnknownFailure(stackTrace: stackTrace);
      case 401:
        return UserUnauthorizedFailure(stackTrace: stackTrace);
      case 403:
        return UserForbiddenFailure(stackTrace: stackTrace);
      case 404:
        return UserNotFoundFailure(stackTrace: stackTrace);
      case 422:
        return UserValidationFailure(stackTrace: stackTrace);
      case 500:
      case 502:
      case 503:
        return UserServerFailure(stackTrace: stackTrace);
      default:
        return UserUnknownFailure(stackTrace: stackTrace);
    }
  }

  String get name;
}

// --- Поиск ---

class UserNotFoundFailure extends UserFailure {
  const UserNotFoundFailure({required super.stackTrace}) : super(message: 'Пользователь не найден');

  @override
  String get name => 'UserNotFoundFailure';
}

// --- Обновление профиля ---

class UserEmailTakenFailure extends UserFailure {
  const UserEmailTakenFailure({required super.stackTrace}) : super(message: 'Этот email уже используется');

  @override
  String get name => 'UserEmailTakenFailure';
}

class UserInvalidFileTypeFailure extends UserFailure {
  const UserInvalidFileTypeFailure({required super.stackTrace}) : super(message: 'Недопустимый формат файла. Разрешены: JPG, PNG, WEBP, GIF');

  @override
  String get name => 'UserInvalidFileTypeFailure';
}

class UserFileTooLargeFailure extends UserFailure {
  const UserFileTooLargeFailure({required super.stackTrace}) : super(message: 'Файл слишком большой. Максимум 5MB');

  @override
  String get name => 'UserFileTooLargeFailure';
}

class UserValidationFailure extends UserFailure {
  const UserValidationFailure({required super.stackTrace}) : super(message: 'Проверьте правильность введённых данных');

  @override
  String get name => 'UserValidationFailure';
}

// --- Доступ ---

class UserUnauthorizedFailure extends UserFailure {
  const UserUnauthorizedFailure({required super.stackTrace}) : super(message: 'Необходима авторизация');

  @override
  String get name => 'UserUnauthorizedFailure';
}

class UserForbiddenFailure extends UserFailure {
  const UserForbiddenFailure({required super.stackTrace}) : super(message: 'Недостаточно прав');

  @override
  String get name => 'UserForbiddenFailure';
}

// --- Общие ---

class UserNetworkFailure extends UserFailure {
  const UserNetworkFailure({required super.stackTrace}) : super(message: 'Нет подключения к интернету');

  @override
  String get name => 'UserNetworkFailure';
}

class UserServerFailure extends UserFailure {
  const UserServerFailure({required super.stackTrace}) : super(message: 'Ошибка сервера, попробуйте позже');

  @override
  String get name => 'UserServerFailure';
}

class UserUnknownFailure extends UserFailure {
  const UserUnknownFailure({required super.stackTrace}) : super(message: 'Неизвестная ошибка');

  @override
  String get name => 'UserUnknownFailure';
}
