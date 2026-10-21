import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:chat_pet/core/storages/exceptions/secure_storage_exception.dart';
import 'package:chat_pet/core/storages/failure/secure_storage_failure.dart';

extension SecureStorageExceptionExtension on SecureStorageException {
  Failure toFailure([StackTrace? stackTrace]) {
    final messagePart = message ?? 'Secure storage error: ($operation)';

    final codePart = code != null ? 'code: [$code]' : '';

    return SecureStorageFailure(
      message: '$messagePart$codePart',
      stackTrace: stackTrace ?? this.stackTrace,
      fieldKey: fieldKey,
    );
  }
}
