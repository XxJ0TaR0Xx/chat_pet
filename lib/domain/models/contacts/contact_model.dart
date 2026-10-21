import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

@freezed
abstract class ContactModel with _$ContactModel {
  const factory ContactModel({
    required DateTime since,
    required UserModel user,
  }) = _ContactModel;
}
