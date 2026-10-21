import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:chat_pet/core/utils/http_error/dio_error_detail_extension.dart';
import 'package:dio/dio.dart';

abstract class AuthFailure extends Failure {
  const AuthFailure({required super.message, required super.stackTrace});

  factory AuthFailure.fromDioException(DioException e, StackTrace stackTrace) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.connectionError) {
      return NetworkFailure(stackTrace: stackTrace);
    }

    final statusCode = e.response?.statusCode;
    final detail = e.detailMessage;

    switch (statusCode) {
      case 400:
        if (detail == 'Email already registered') {
          return EmailAlreadyInUseFailure(stackTrace: stackTrace);
        }
        return UnknownAuthFailure(stackTrace: stackTrace);
      case 401:
        if (detail == 'Invalid credentials') {
          return WrongCredentialsFailure(stackTrace: stackTrace);
        }
        if (detail == 'Invalid refresh token') {
          return SessionExpiredFailure(stackTrace: stackTrace);
        }
        return UnknownAuthFailure(stackTrace: stackTrace);
      case 403:
        return OperationNotAllowedFailure(stackTrace: stackTrace);
      case 404:
        return UserNotFoundFailure(stackTrace: stackTrace);
      case 422:
        return ValidationFailure(stackTrace: stackTrace);
      case 429:
        return TooManyRequestsFailure(stackTrace: stackTrace);
      case 500:
      case 502:
      case 503:
        return ServerFailure(stackTrace: stackTrace);
      default:
        return UnknownAuthFailure(stackTrace: stackTrace);
    }
  }
}

// --- Login ---

class WrongCredentialsFailure extends AuthFailure {
  const WrongCredentialsFailure({required super.stackTrace}) : super(message: 'Неверный email или пароль');

  @override
  String get name => 'WrongCredentialsFailure';
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure({required super.stackTrace}) : super(message: 'Пользователь не найден');

  @override
  String get name => 'UserNotFoundFailure';
}

class UserDisabledFailure extends AuthFailure {
  const UserDisabledFailure({required super.stackTrace}) : super(message: 'Аккаунт заблокирован');

  @override
  String get name => 'UserDisabledFailure';
}

class SessionExpiredFailure extends AuthFailure {
  const SessionExpiredFailure({required super.stackTrace}) : super(message: 'Сессия истекла, войдите снова');

  @override
  String get name => 'SessionExpiredFailure';
}

// --- Registration ---

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure({required super.stackTrace}) : super(message: 'Email уже используется');

  @override
  String get name => 'EmailAlreadyInUseFailure';
}

class ValidationFailure extends AuthFailure {
  const ValidationFailure({required super.stackTrace}) : super(message: 'Проверьте правильность введённых данных');

  @override
  String get name => 'ValidationFailure';
}

// --- Common ---

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure({required super.stackTrace}) : super(message: 'Слишком много запросов, попробуйте позже');

  @override
  String get name => 'TooManyRequestsFailure';
}

class UnknownAuthFailure extends AuthFailure {
  const UnknownAuthFailure({required super.stackTrace}) : super(message: 'Неизвестная ошибка');

  @override
  String get name => 'UnknownAuthFailure';
}

class ServerFailure extends AuthFailure {
  const ServerFailure({required super.stackTrace}) : super(message: 'Ошибка сервера, попробуйте позже');

  @override
  String get name => 'ServerFailure';
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure({required super.stackTrace}) : super(message: 'Нет подключения к интернету');

  @override
  String get name => 'NetworkFailure';
}

class OperationNotAllowedFailure extends AuthFailure {
  const OperationNotAllowedFailure({required super.stackTrace}) : super(message: 'Операция не разрешена');

  @override
  String get name => 'OperationNotAllowedFailure';
}
