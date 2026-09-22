import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ReadMessagesUseCase {
  const ReadMessagesUseCase(this._chatRepository);
  final ChatRepository _chatRepository;

  Future<void> call(String chatId) => _chatRepository.readMessages(chatId);
}
