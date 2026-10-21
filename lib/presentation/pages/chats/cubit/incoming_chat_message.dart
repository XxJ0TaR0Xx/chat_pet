import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';

/// One-off событие "пришло новое сообщение", отдельное от ChatState.
///
/// ChatState — это снепшот списка чатов (для BlocBuilder), а показ баннера —
/// это разовый эффект, который не должен повторяться при пересборке виджета
/// на тот же state. Поэтому это отдельный broadcast-стрим в ChatCubit,
/// а не часть состояния.
class IncomingChatMessage {
  const IncomingChatMessage({required this.chat, required this.message});

  final ChatModel chat;
  final MessageModel message;
}
