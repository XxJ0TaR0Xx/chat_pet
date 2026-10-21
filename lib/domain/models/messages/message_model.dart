import 'package:chat_pet/domain/models/messages/reply_to_message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String chatId,
    required String senderId,
    required ContentType contentType,
    required DateTime createAt,
    required String content,
    @Default(MessageSender.me) MessageSender messageSender,
    @Default(false) bool isEditing,
    ReplyToMessageModel? replyTo,
  }) = _MessageModel;
}

enum ContentType { text, image, video, audio }

enum MessageSender { me, another }

/// Курсорный read-статус (last_read_at), без per-message read receipts.
enum MessageReadStatus { sent, read }
