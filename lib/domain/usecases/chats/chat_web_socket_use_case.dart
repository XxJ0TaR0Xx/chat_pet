import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChatWebSocketUseCase {
  const ChatWebSocketUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Stream<ChatSocketEvent> call({required String chatId}) => _chatRepository.connectToChat(chatId);
}
