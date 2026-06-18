import 'dart:async';
import 'dart:convert';

import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@lazySingleton
class WebSocketService {
  WebSocketService(this._tokenManager) {
    _authSub = _tokenManager.isAuthorized.listen((authorized) {
      if (!authorized) disconnect();
    });
  }

  final TokenManager _tokenManager;
  final _controller = StreamController<Map<String, dynamic>>.broadcast();

  WebSocketChannel? _channel;
  String? _lastUrl;
  bool _disposed = false;
  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;
  StreamSubscription<bool>? _authSub;

  Stream<Map<String, dynamic>> get stream => _controller.stream;

  void connect(String url) {
    _lastUrl = url;
    _disposed = false;
    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _connect();
  }

  void disconnect() {
    _disposed = true;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _channel?.sink.close();
    _channel = null;
  }

  void _connect() {
    if (_disposed || _lastUrl == null) return;

    final token = _tokenManager.accessToken;
    if (token == null) {
      talk.warning('[WS] No token available, skipping connect');
      return;
    }

    talk.info('[WS] Connecting... (attempt $_reconnectAttempts)');
    _channel = WebSocketChannel.connect(Uri.parse('$_lastUrl?token=$token'));

    _channel!.stream.listen(
      (data) {
        _reconnectAttempts = 0;
        talk.info('[WS] Received: $data');
        _controller.add(jsonDecode(data as String) as Map<String, dynamic>);
      },
      onError: (e) {
        talk.error('[WS] Error: $e');
        _controller.addError(e);
        _scheduleReconnect();
      },
      onDone: () {
        talk.info('[WS] Connection closed');
        _scheduleReconnect();
      },
    );
  }

  void _scheduleReconnect() {
    if (_disposed) return;

    _reconnectAttempts++;
    if (_reconnectAttempts > 10) {
      talk.error('[WS] Max reconnect attempts reached, stopping');
      return;
    }

    final seconds = _backoffSeconds();
    talk.info('[WS] Reconnecting in ${seconds}s...');
    _reconnectTimer = Timer(Duration(seconds: seconds), _connect);
  }

  int _backoffSeconds() {
    const delays = [3, 6, 12, 24, 30];
    return delays[(_reconnectAttempts - 1).clamp(0, delays.length - 1)];
  }

  @disposeMethod
  void dispose() {
    _authSub?.cancel();
    disconnect();
    _controller.close();
  }
}
