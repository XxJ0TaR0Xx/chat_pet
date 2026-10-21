import 'dart:async';
import 'dart:convert';

import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketConnection {
  SocketConnection({required this.getToken});

  final String? Function() getToken;

  final _controller = StreamController<Map<String, dynamic>>.broadcast();

  WebSocketChannel? _channel;

  StreamSubscription<dynamic>? _channelSubscription;
  String? _url;
  bool _disposed = false;
  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;

  Stream<Map<String, dynamic>> get stream => _controller.stream;

  void send(Map<String, dynamic> data) {
    final channel = _channel;
    if (channel == null) {
      talk.warning('[WS] Not connected, dropping outgoing message: $data');
      return;
    }

    channel.sink.add(jsonEncode(data));
  }

  void connect(String url) {
    _url = url;
    _disposed = false;
    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();
    _channelSubscription?.cancel();
    _channel?.sink.close();
    _connect();
  }

  void disconnect() {
    _disposed = true;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _channelSubscription?.cancel();
    _channelSubscription = null;
    _channel?.sink.close();
    _channel = null;
  }

  void _connect() {
    if (_disposed || _url == null) return;

    final token = getToken();
    if (token == null) {
      talk.warning('[WS] No token available, skipping connect');
      return;
    }

    talk.info('[WS] Connecting to $_url... (attempt $_reconnectAttempts)');
    _channel = WebSocketChannel.connect(Uri.parse('$_url?token=$token'));

    _channelSubscription = _channel!.stream.listen(
      (data) {
        if (_disposed) return;

        _reconnectAttempts = 0;
        talk.info('[WS] Received: $data');
        _controller.add(jsonDecode(data as String) as Map<String, dynamic>);
      },
      onError: (e) {
        if (_disposed) return;

        talk.error('[WS] Error: $e');
        _controller.addError(e);
        _scheduleReconnect();
      },
      onDone: () {
        if (_disposed) return;

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

  void dispose() {
    disconnect();
    _controller.close();
  }
}
