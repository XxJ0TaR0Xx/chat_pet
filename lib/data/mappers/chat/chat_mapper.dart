import 'package:chat_pet/data/mappers/messages/message_mapper.dart';
import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/chat/chat_dto.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';

extension ChatDtoMapper on ChatDto {
  ChatModel toDomain() => ChatModel(
    id: id,
    members: members.map((e) => e.toDomain()).toList(),
    isGroup: isGroup,
    avatarUrl: avatarUrl,
    createAt: createAt,
    displayName: displayName,
    lastMessage: lastMessage?.toDomain(),
    name: name,
    uncheckedMessageCount: uncheckedMessageCount,
  );
}
