import 'package:chat_pet/domain/failures/failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.message);
}

/// Login

class WrongPasswordFailure extends AuthFailure {
  WrongPasswordFailure() : super('Wrong password');
}

class UserNotFoundFailure extends AuthFailure {
  UserNotFoundFailure() : super('User not found');
}

class UserDisabledFailure extends AuthFailure {
  UserDisabledFailure() : super('User account is disabled');
}

/// Registration

class EmailAlreadyInUseFailure extends AuthFailure {
  EmailAlreadyInUseFailure() : super('Email is already in use');
}

/// Common

class TooManyRequestsFailure extends AuthFailure {
  TooManyRequestsFailure() : super('Too many requests. Try again later');
}

class UnknownAuthFailure extends AuthFailure {
  UnknownAuthFailure() : super('Unknown authentication error');
}

class ServerFailure extends AuthFailure {
  ServerFailure() : super('Server error occurred');
}

class NetworkFailure extends AuthFailure {
  NetworkFailure() : super('Network connection failed');
}

class OperationNotAllowedFailure extends AuthFailure {
  OperationNotAllowedFailure() : super('Operation not allowed');
}
