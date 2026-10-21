import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/data/common/services/web_socket/socket_connection.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';

class ChatWebSocket {
  ChatWebSocket(TokenManager tokenManager) : _connection = SocketConnection(getToken: () => tokenManager.accessToken);

  final SocketConnection _connection;

  Stream<Map<String, dynamic>> get stream => _connection.stream;

  void connect(String chatId) => _connection.connect('${ApiConfig.current.wsUrl}ws/$chatId');

  void sendMessage(Map<String, dynamic> data) => _connection.send(data);

  void dispose() => _connection.dispose();
}
