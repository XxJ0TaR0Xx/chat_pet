import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchChatMessagesUseCase {
  const WatchChatMessagesUseCase(this._repository);

  final ChatRepository _repository;

  Stream<MessageModel> call() => _repository.watchMessages();
}
