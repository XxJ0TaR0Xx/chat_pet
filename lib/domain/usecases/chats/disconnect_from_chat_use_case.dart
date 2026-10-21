import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DisconnectFromChatUseCase {
  const DisconnectFromChatUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  void call() => _chatRepository.disconnectFromChat();
}
