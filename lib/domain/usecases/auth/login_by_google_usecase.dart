import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginByGoogleUseCase {
  const LoginByGoogleUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, UserEntity>> call() {
    return _repository.loginByGoogle();
  }
}
