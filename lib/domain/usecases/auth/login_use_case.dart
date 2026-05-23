import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
  const LoginUseCase(this._authRepositoryImpl);
  final AuthRepository _authRepositoryImpl;

  Future<Either<AuthFailure, void>> call({
    required String password,
    required String email,
  }) async => _authRepositoryImpl.login(email: email, password: password);
}
