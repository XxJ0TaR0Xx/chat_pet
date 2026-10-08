import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCurrentUserUseCase {
  const WatchCurrentUserUseCase(this._userRepository);
  final UserRepository _userRepository;

  Stream<UserModel?> call() => _userRepository.watchCurrentUser();
}
