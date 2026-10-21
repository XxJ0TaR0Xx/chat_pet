import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ContactsRepository {
  Future<Either<ContactsFailure, List<UserModel>>> searchContacts(String userTag);

  Future<Either<ContactsFailure, List<UserModel>>> getContacts();

  Future<Either<ContactsFailure, Unit>> sendRequest(String userId);

  Future<Either<ContactsFailure, UserModel>> acceptRequest(String requestId);

  Future<Either<ContactsFailure, Unit>> rejectRequest(String requestId);

  Future<Either<ContactsFailure, Unit>> deleteContacts(String contactId);

  Future<Either<ContactsFailure, List<ContactModelRequest>>> incomingRequest();

  Stream<ContactModelRequest> get incomingRequestStream;
}
