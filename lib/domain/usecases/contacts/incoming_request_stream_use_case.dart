import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class IncomingRequestStreamUseCase {
  const IncomingRequestStreamUseCase(this._contactsRepository);

  final ContactsRepository _contactsRepository;

  Stream<ContactRequest> call() => _contactsRepository.incomingRequestStream;
}
