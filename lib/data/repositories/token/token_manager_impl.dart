import 'dart:async';

import 'package:chat_pet/core/common/failures/disposed_failure.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/auth/tokens.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenManager)
class TokenManagerImpl implements TokenManager {
  Tokens? _tokens;
  bool? _lastEvent;

  var _disposed = false;
  final _listeners = <MultiStreamController<bool>>{};

  late final _authStream = Stream<bool>.multi(
    isBroadcast: true,
    (controller) {
      if (_lastEvent != null) controller.add(_lastEvent!);

      _listeners.add(controller);
      talk.verbose('New listener subscribed (count: ${_listeners.length})');

      controller.onCancel = () {
        _listeners.remove(controller);
        talk.verbose('Listener unsubscribed (count: ${_listeners.length})');
      };
    },
  );

  @override
  String? get accessToken => _guard(_tokens?.accessToken);

  @override
  String? get refreshToken => _guard(_tokens?.refreshToken);

  @override
  Stream<bool> get isAuthorized => _guard(_authStream);

  @override
  void updateToken(Tokens? tokens) {
    if (tokens == _tokens) return;

    _tokens = tokens;
    _emitEvent(tokens != null);
    talk.info('tokens updated');
  }

  @override
  void clear() {
    _ensureNotDisposed();
    _tokens = null;
    _emitEvent(false);
    talk.info('Tokens cleared');
  }

  @override
  @disposeMethod
  FutureOr<dynamic> dispose() async {
    if (_disposed) return;
    _ensureNotDisposed();
    talk.info('Disposing');

    _disposed = true;
    _tokens = null;

    await Future.wait(_listeners.map((e) => e.close()));
    _listeners.clear();

    talk.info('Disposed successfully');
  }

  void _emitEvent(bool newEvent) {
    if (_lastEvent == newEvent) return;

    _lastEvent = newEvent;
    talk.debug('Auth state changed: authorized=$newEvent');

    for (final controller in [..._listeners]) {
      if (!controller.isClosed) controller.add(newEvent);
    }
  }

  T _guard<T>(value) {
    _ensureNotDisposed();
    return value;
  }

  void _ensureNotDisposed() {
    if (!_disposed) return;

    talk.warning('Attempt to access after dispose');
    throw DisposedFailure(
      objectName: 'TokenManager',
      stackTrace: StackTrace.current,
    );
  }
}
