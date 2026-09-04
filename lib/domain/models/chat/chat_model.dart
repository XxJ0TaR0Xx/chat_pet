import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required List<UserModel> members,
    required bool isGroup,
    String? name,
    DateTime? createAt,
    String? displayName,
    String? avatarUrl,
    MessageModel? lastMessage,
    @Default(0) int uncheckedMessageCount,
  }) = _ChatModel;

  const ChatModel._();
}
