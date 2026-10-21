import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model_request.freezed.dart';

@freezed
abstract class ContactModelRequest with _$ContactModelRequest {
  const factory ContactModelRequest({
    required String id,
    required UserModel sender,
    UserModel? receiver,
  }) = _ContactModelRequest;
}
