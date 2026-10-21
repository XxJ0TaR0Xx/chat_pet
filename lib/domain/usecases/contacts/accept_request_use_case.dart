import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AcceptRequestUseCase {
  const AcceptRequestUseCase(this._contactsRepository);

  final ContactsRepository _contactsRepository;

  Future<Either<ContactsFailure, UserModel>> call({required String requestId}) {
    if (requestId.isEmpty) return Future.value(Left(ContactsValidationFailure(stackTrace: StackTrace.current)));

    return _contactsRepository.acceptRequest(requestId);
  }
}
