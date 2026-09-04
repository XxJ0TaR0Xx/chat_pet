import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateChatUseCase {
  const CreateChatUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Future<Either<ChatFailure, ChatModel>> call({
    required List<String> membersIds,
    String? chatName,
    bool isGroup = false,
  }) => _chatRepository.createChat(chatName, isGroup, membersIds);
}
