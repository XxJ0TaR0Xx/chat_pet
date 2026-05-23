import 'package:chat_pet/core/common/failures/failure.dart';

final class SecureStorageFailure extends Failure {
  const SecureStorageFailure({
    required super.message,
    required super.stackTrace,
    required this.fieldKey,
  });

  final String? fieldKey;

  @override
  List<Object?> get props => [...super.props, fieldKey];

  @override
  String get name => 'SecureStorageFailure';

  @override
  String toString() => '$name(message: $message, filedKey: $fieldKey)';
}
