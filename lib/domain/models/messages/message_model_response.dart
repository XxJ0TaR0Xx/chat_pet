import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model_response.freezed.dart';

@freezed
abstract class MessageModelResponse with _$MessageModelResponse {
  const factory MessageModelResponse({
    required List<MessageModel> items,
    String? cursor,
  }) = _MessageModelResponse;
}
