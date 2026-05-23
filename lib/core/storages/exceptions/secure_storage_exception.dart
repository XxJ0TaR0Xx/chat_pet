import 'package:equatable/equatable.dart';

final class SecureStorageException extends Equatable implements Exception {
  const SecureStorageException({
    required this.operation,
    required this.stackTrace,
    this.fieldKey,
    this.code,
    this.message,
  });

  final String operation;

  final StackTrace stackTrace;

  final String? fieldKey;

  final String? code;

  final String? message;

  @override
  List<Object?> get props => [operation, fieldKey, code, message];

  @override
  String toString() => 'SecureStorageException(operation: $operation, fieldKey: $fieldKey, code: $code, message: $message)';
}
