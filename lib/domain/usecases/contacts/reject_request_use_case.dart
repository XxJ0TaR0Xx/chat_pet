import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RejectRequestUseCase {
  const RejectRequestUseCase(this._contactsRepository);

  final ContactsRepository _contactsRepository;

  Future<Either<ContactsFailure, Unit>> call({required String requestId}) {
    if (requestId.isEmpty) return Future.value(Left(ContactsValidationFailure(stackTrace: StackTrace.current)));
    return _contactsRepository.rejectRequest(requestId);
  }
}
