import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:chat_pet/data/models/message/message_response_dto.dart';
import 'package:chat_pet/data/models/message/message_update_dto.dart';
import 'package:chat_pet/data/models/message/reply_to_message_dto.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/message_model_response.dart';
import 'package:chat_pet/domain/models/messages/reply_to_message_model.dart';

extension MessageMapper on MessageDto {
  MessageModel toDomain() => MessageModel(
    id: id,
    chatId: chatId,
    senderId: senderId,
    contentType: contentType,
    createAt: createAt,
    content: content,
    isEditing: isEditing,
    replyTo: replyTo?.toDomain(),
  );
}

extension MessageModelResponseMapper on MessageModelResponseDto {
  MessageModelResponse toDomain() => MessageModelResponse(
    items: items.map((e) => e.toDomain()).toList(),
    cursor: cursor,
  );
}

extension MessageUpdatePayload on MessageModel {
  MessageUpdateDto toUpdateDto() => MessageUpdateDto(content: content);
}

extension ReplyToMessageMapper on ReplyToMessageDto {
  ReplyToMessageModel toDomain() {
    final senderId = this.senderId;
    final contentType = this.contentType;

    if (deleted || senderId == null || contentType == null) return ReplyToMessageModel.deleted(id: id);

    return ReplyToMessageModel.available(
      id: id,
      senderId: senderId,
      content: content ?? '',
      contentType: contentType,
    );
  }
}
