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
  }) = _MessageModel;
}

enum ContentType { text, image, video, audio }

enum MessageSender { me, another }
