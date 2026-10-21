import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_to_message_model.freezed.dart';

@freezed
sealed class ReplyToMessageModel with _$ReplyToMessageModel {
  const factory ReplyToMessageModel.available({
    required String id,
    required String senderId,
    required String content,
    required ContentType contentType,
  }) = AvailableReplyTo;

  /// Оригинал удалён — от него остался только id.
  const factory ReplyToMessageModel.deleted({required String id}) = DeletedReplyTo;
}
