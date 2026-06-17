import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:dio/dio.dart';

abstract class ContactsFailure extends Failure {
  const ContactsFailure({required super.message, required super.stackTrace});

  factory ContactsFailure.fromDioException(DioException e, StackTrace stackTrace) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return ContactsNetworkFailure(stackTrace: stackTrace);
    }

    final statusCode = e.response?.statusCode;
    final rawDetail = e.response?.data?['detail'];
    final detail = rawDetail is String ? rawDetail : null;

    switch (statusCode) {
      case 400:
        if (detail?.contains('already added') ?? false) {
          return ContactsAlreadyAddedFailure(stackTrace: stackTrace);
        }
        if (detail?.contains('already sent') ?? false) {
          return ContactsRequestAlreadySentFailure(stackTrace: stackTrace);
        }
        if (detail?.contains('yourself') ?? false) {
          return ContactsCannotAddYourselfFailure(stackTrace: stackTrace);
        }
        return ContactsUnknownFailure(stackTrace: stackTrace);
      case 401:
        return ContactsUnauthorizedFailure(stackTrace: stackTrace);
      case 403:
        return ContactsForbiddenFailure(stackTrace: stackTrace);
      case 404:
        return ContactsNotFoundFailure(stackTrace: stackTrace);
      case 422:
        return ContactsValidationFailure(stackTrace: stackTrace);
      case 500:
      case 502:
      case 503:
        return ContactsServerFailure(stackTrace: stackTrace);
      default:
        return ContactsUnknownFailure(stackTrace: stackTrace);
    }
  }

  @override
  String get name;
}

// --- Поиск ---

class ContactsNotFoundFailure extends ContactsFailure {
  const ContactsNotFoundFailure({required super.stackTrace}) : super(message: 'Пользователь не найден');

  @override
  String get name => 'ContactsNotFoundFailure';
}

// --- Заявки ---

class ContactsAlreadyAddedFailure extends ContactsFailure {
  const ContactsAlreadyAddedFailure({required super.stackTrace}) : super(message: 'Этот пользователь уже в контактах');

  @override
  String get name => 'ContactsAlreadyAddedFailure';
}

class ContactsRequestAlreadySentFailure extends ContactsFailure {
  const ContactsRequestAlreadySentFailure({required super.stackTrace}) : super(message: 'Заявка уже отправлена');

  @override
  String get name => 'ContactsRequestAlreadySentFailure';
}

class ContactsCannotAddYourselfFailure extends ContactsFailure {
  const ContactsCannotAddYourselfFailure({required super.stackTrace}) : super(message: 'Нельзя добавить самого себя');

  @override
  String get name => 'ContactsCannotAddYourselfFailure';
}

class ContactsValidationFailure extends ContactsFailure {
  const ContactsValidationFailure({required super.stackTrace}) : super(message: 'Проверьте правильность введённых данных');

  @override
  String get name => 'ContactsValidationFailure';
}

// --- Доступ ---

class ContactsUnauthorizedFailure extends ContactsFailure {
  const ContactsUnauthorizedFailure({required super.stackTrace}) : super(message: 'Необходима авторизация');

  @override
  String get name => 'ContactsUnauthorizedFailure';
}

class ContactsForbiddenFailure extends ContactsFailure {
  const ContactsForbiddenFailure({required super.stackTrace}) : super(message: 'Недостаточно прав');

  @override
  String get name => 'ContactsForbiddenFailure';
}

// --- Общие ---

class ContactsNetworkFailure extends ContactsFailure {
  const ContactsNetworkFailure({required super.stackTrace}) : super(message: 'Нет подключения к интернету');

  @override
  String get name => 'ContactsNetworkFailure';
}

class ContactsServerFailure extends ContactsFailure {
  const ContactsServerFailure({required super.stackTrace}) : super(message: 'Ошибка сервера, попробуйте позже');

  @override
  String get name => 'ContactsServerFailure';
}

class ContactsUnknownFailure extends ContactsFailure {
  const ContactsUnknownFailure({required super.stackTrace}) : super(message: 'Неизвестная ошибка');

  @override
  String get name => 'ContactsUnknownFailure';
}
