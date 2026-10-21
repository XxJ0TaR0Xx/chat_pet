import 'dart:async';
import 'dart:math';

abstract class RetryUtil {
  static final _random = Random();

  static Future<T> run<T>({
    required FutureOr<T> Function() action,
    Duration initialDelay = const Duration(milliseconds: 200),
    Duration maxDelay = const Duration(minutes: 1),
    int maxAttempts = 5,
    FutureOr<bool> Function(Object error, StackTrace stackTrace)? retryIf,
  }) async {
    if (maxAttempts < 1) throw ArgumentError('', 'maxAttempts');

    for (var attempt = 1; ; attempt++) {
      try {
        return await action();
      } catch (e, st) {
        if (attempt == maxAttempts) rethrow;
        if (retryIf != null && !(await retryIf(e, st))) rethrow;

        await Future.delayed(_getDelay(initialDelay, attempt, maxDelay));
      }
    }
  }

  static Duration _getDelay(Duration initialDelay, int attempt, Duration maxDelay) {
    final exp = min(attempt - 1, 31);
    final baseDelayMs = initialDelay.inMilliseconds * pow(2, exp).toInt();

    final jitterFactor = 0.2 * (_random.nextDouble() * 2 - 1);
    final jitterMs = (baseDelayMs * jitterFactor).toInt();

    final delay = Duration(milliseconds: baseDelayMs + jitterMs);

    return delay > maxDelay ? maxDelay : delay;
  }
}
