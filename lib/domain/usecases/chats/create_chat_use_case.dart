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
  }) async {
    if (!isGroup && membersIds.length == 1) {
      // Search every page: the chat may not be in the currently visible list.
      const pageSize = 50;
      var offset = 0;
      while (true) {
        final result = await _chatRepository.getChats(offset: offset);
        final failure = result.getLeft().toNullable();
        if (failure != null) return Left(failure);

        final chats = result.getRight().toNullable()!;
        final existing = chats
            .where(
              (chat) => !chat.isGroup && chat.members.any((member) => member.id == membersIds.single),
            )
            .firstOrNull;
        if (existing != null) return Right(existing);
        if (chats.length < pageSize) break;
        offset += chats.length;
      }
    }

    return _chatRepository.createChat(chatName, isGroup, membersIds);
  }
}
