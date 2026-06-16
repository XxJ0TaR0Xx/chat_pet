import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class IncomingRequestsUseCase {
  const IncomingRequestsUseCase(this._contactsRepository);

  final ContactsRepository _contactsRepository;

  Future<Either<ContactsFailure, List<ContactRequest>>> call() => _contactsRepository.incomingRequest();
}
