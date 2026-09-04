import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateMessageUseCase {
  const UpdateMessageUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Future<Either<ChatFailure, MessageModel>> call({
    required MessageModel messageModel,
    required String chatId,
    required String messageId,
  }) => _chatRepository.updateMessage(
    messageModel,
    chatId: chatId,
    messageId: messageId,
  );
}
