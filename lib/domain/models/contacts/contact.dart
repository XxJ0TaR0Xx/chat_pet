import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required DateTime since,
    required UserModel user,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
