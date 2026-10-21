import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_member_model.freezed.dart';

@freezed
abstract class ChatMemberModel with _$ChatMemberModel {
  const factory ChatMemberModel({
    required UserModel user,
    DateTime? lastReadAt,
  }) = _ChatMemberModel;

  const ChatMemberModel._();
  String get id => user.id;
}
