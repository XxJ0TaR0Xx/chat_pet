import 'dart:async';
import 'dart:convert';

import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@lazySingleton
class WebSocketService {
  WebSocketChannel? _channel;
  final _controller = StreamController<Map<String, dynamic>>.broadcast();

  String? _lastUrl;
  String? _lastToken;

  Stream<Map<String, dynamic>> get stream => _controller.stream;

  void connect(String url, String token) {
    _lastUrl = url;
    _lastToken = token;
    _connect();
  }

  void _connect() {
    if (_lastUrl == null || _lastToken == null) return;

    final fullUrl = '$_lastUrl?token=$_lastToken';
    talk.info('[WS] Connecting to $fullUrl');

    _channel = WebSocketChannel.connect(Uri.parse(fullUrl));

    _channel!.stream.listen(
      (data) {
        talk.info('[WS] Received: $data');
        _controller.add(jsonDecode(data as String) as Map<String, dynamic>);
      },
      onError: (e) {
        talk.error('[WS] Error: $e');
        _controller.addError(e);
        _scheduleReconnect();
      },
      onDone: () {
        talk.error('[WS] Connection closed, reconnecting...');
        _scheduleReconnect();
      },
    );
  }

  void _scheduleReconnect() {
    Future.delayed(const Duration(seconds: 3), _connect);
  }

  void disconnect() {
    _lastUrl = null;
    _lastToken = null;
    _channel?.sink.close();
    _channel = null;
  }
}
