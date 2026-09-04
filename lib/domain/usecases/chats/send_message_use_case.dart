import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SendMessageUseCase {
  const SendMessageUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  void call({
    required String chaId,
    required String content,
    ContentType contentType = ContentType.text,
  }) => _chatRepository.sendMessage(chaId, content: content, contentType: contentType);
}
