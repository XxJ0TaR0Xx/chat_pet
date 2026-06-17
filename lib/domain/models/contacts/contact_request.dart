import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_request.freezed.dart';
part 'contact_request.g.dart';

@freezed
abstract class ContactRequest with _$ContactRequest {
  const factory ContactRequest({
    required String id,
    required UserModel sender,
    UserModel? receiver,
  }) = _ContactRequest;

  factory ContactRequest.fromJson(Map<String, dynamic> json) => _$ContactRequestFromJson(json);
}
