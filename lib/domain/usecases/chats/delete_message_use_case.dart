import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteMessageUseCase {
  const DeleteMessageUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Future<Either<ChatFailure, void>> call({
    required String chatId,
    required String messageId,
    bool forEveryone = false,
  }) => _chatRepository.deleteMessage(chatId, messageId, forEveryone);
}
