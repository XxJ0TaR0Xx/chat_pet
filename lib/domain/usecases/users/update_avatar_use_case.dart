import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateAvatarUseCase {
  const UpdateAvatarUseCase(this._usersRepository);

  final UserRepository _usersRepository;

  Future<Either<UserFailure, UserModel>> call({required String imagePath}) async => _usersRepository.updateAvatar(imagePath);
}
