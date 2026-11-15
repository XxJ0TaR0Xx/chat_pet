import 'package:chat_pet/core/common/disposable.dart';
import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/message_model_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ChatRepository implements Disposable {
  /// Confirmed messages received through the active chat connection.
  Stream<MessageModel> watchMessages();

  Future<Either<ChatFailure, List<ChatModel>>> getChats({
    int? offset,
    int limit = 50,
  });

  Future<Either<ChatFailure, ChatModel>> createChat(
    String? chatName,
    bool isGroup,
    List<String> membersIds,
  );

  Future<Either<ChatFailure, void>> deleteChat(String chatId);

  Future<Either<ChatFailure, MessageModelResponse>> getMessages(
    String chatId, {
    String? cursor,
    int limit = 50,
  });

  Future<Either<ChatFailure, void>> deleteMessages(
    String chatId,
    List<String> messageIds,
    bool forEveryone,
  );

  Future<Either<ChatFailure, MessageModel>> updateMessage(
    MessageModel messageModel, {
    required String chatId,
    required String messageId,
  });

  Future<Either<ChatFailure, void>> deleteMessage(
    String chatId,
    String messageId,
    bool forEveryone,
  );

  Future<void> readMessages(String chatId);

  Stream<ChatSocketEvent> connectToChat(String chatId);

  void disconnectFromChat();

  void sendMessage(
    String chaId, {
    required String content,
    ContentType contentType,
    String? replyToId,
  });
}
