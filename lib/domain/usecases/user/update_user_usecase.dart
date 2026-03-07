import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/repositories/firebase/firebase_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateUserUseCase {
  const UpdateUserUseCase(this.repository);

  final FirebaseRepository repository;

  Future<Either<UserFailures, void>> call({UserModel? user}) {
    return repository.updateUser(user);
  }
}
