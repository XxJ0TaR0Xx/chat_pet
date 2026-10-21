import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:chat_pet/domain/interfaces/user/user_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
  const LoginUseCase(this._authRepositoryImpl, this._userRepository);
  final AuthRepository _authRepositoryImpl;
  final UserRepository _userRepository;

  Future<Either<Failure, UserModel>> call({
    required String password,
    required String email,
  }) async {
    final loginResult = await _authRepositoryImpl.login(email: email, password: password);
    return loginResult.fold(
      (failure) async => Left(failure),
      (_) async => await _userRepository.getMe(),
    );
  }
}
