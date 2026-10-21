import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/messages/message_model_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetMessagesUseCase {
  const GetMessagesUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Future<Either<ChatFailure, MessageModelResponse>> call({
    required String chatId,
    String? cursor,
  }) => _chatRepository.getMessages(chatId, cursor: cursor);
}
