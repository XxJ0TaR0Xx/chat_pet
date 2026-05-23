import 'package:chat_pet/core/common/failures/failure.dart';

final class DisposedFailure extends Failure {
  const DisposedFailure({
    required this.objectName,
    required super.stackTrace,
  }) : super(message: 'Tried to use $objectName after dispose');

  final String objectName;

  @override
  String get name => 'DisposedFailure';
}
