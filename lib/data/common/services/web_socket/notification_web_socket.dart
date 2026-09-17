import 'dart:async';

import 'package:chat_pet/data/common/services/web_socket/socket_connection.dart';
import 'package:chat_pet/data/mappers/notifications/notification_socket_event_mapper.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';
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

  Stream<NotificationSocketEvent> get events =>
      _connection.stream.map(notificationSocketEventFromJson).where((event) => event != null).cast<NotificationSocketEvent>();

  void connect(String url) => _connection.connect(url);

  void disconnect() => _connection.disconnect();

  @disposeMethod
  void dispose() {
    _authSub?.cancel();
    _connection.dispose();
  }
}
