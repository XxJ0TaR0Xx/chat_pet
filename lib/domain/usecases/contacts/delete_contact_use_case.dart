import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteContactUseCase {
  const DeleteContactUseCase(this._contactsRepository);

  final ContactsRepository _contactsRepository;

  Future<Either<ContactsFailure, Unit>> call({required String contactId}) => _contactsRepository.deleteContacts(contactId);
}
