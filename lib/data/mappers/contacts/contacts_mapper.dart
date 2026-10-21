import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/contacts/contact_dto.dart';
import 'package:chat_pet/data/models/contacts/contact_request_dto.dart';
import 'package:chat_pet/domain/models/contacts/contact_model.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';

extension ContactsRequestMapper on ContactModelRequestDto {
  ContactModelRequest toDomain() => ContactModelRequest(
    id: id,
    sender: sender.toDomain(),
    receiver: receiver?.toDomain(),
  );
}

extension ContactsMapper on ContactDto {
  ContactModel toDomain() => ContactModel(
    since: since,
    user: user.toDomain(),
  );
}
