import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/reply_to_message_model.dart';
import 'package:flutter/foundation.dart';

typedef AuthorNameResolver = String Function(String senderId);

/// Данные для отрисовки цитаты в пузыре: оригинал + уже резолвленное имя автора.
@immutable
final class ReplyPreview {
  const ReplyPreview({required this.reply, this.authorName});

  final ReplyToMessageModel reply;

  final String? authorName;

  static ReplyPreview? of(MessageModel message, AuthorNameResolver authorNameOf) => switch (message.replyTo) {
    null => null,
    final AvailableReplyTo reply => ReplyPreview(reply: reply, authorName: authorNameOf(reply.senderId)),
    final DeletedReplyTo reply => ReplyPreview(reply: reply),
  };
}
