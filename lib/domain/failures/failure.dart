abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(Object other) {
    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
