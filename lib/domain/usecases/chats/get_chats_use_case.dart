import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetChatsUseCase {
  const GetChatsUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  Future<Either<ChatFailure, List<ChatModel>>> call({int? offset}) => _chatRepository.getChats(offset: offset);
}
