import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/users/users_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetMeUseCase {
  const GetMeUseCase(this._usersRepository);

  final UsersRepository _usersRepository;

  Future<Either<UserFailure, UserModel>> call() async => _usersRepository.getMe();
}
