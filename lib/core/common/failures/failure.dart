import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.stackTrace,
  });

  final String message;
  final StackTrace stackTrace;

  String get name;

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$name(message: $message)';
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    required super.message,
    required super.stackTrace,
  });

  @override
  String get name => 'UnexpectedFailure';
}
