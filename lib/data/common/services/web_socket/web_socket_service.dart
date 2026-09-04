import 'dart:async';

import 'package:chat_pet/data/common/services/web_socket/socket_connection.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationWebSocket {
  NotificationWebSocket(this._tokenManager) {
    _connection = SocketConnection(getToken: () => _tokenManager.accessToken);
    _authSub = _tokenManager.isAuthorized.listen((authorized) {
      if (!authorized) disconnect();
    });
  }

  final TokenManager _tokenManager;
  late final SocketConnection _connection;
  StreamSubscription<bool>? _authSub;

  Stream<Map<String, dynamic>> get stream => _connection.stream;

  void connect(String url) => _connection.connect(url);

  void disconnect() => _connection.disconnect();

  @disposeMethod
  void dispose() {
    _authSub?.cancel();
    _connection.dispose();
  }
}
