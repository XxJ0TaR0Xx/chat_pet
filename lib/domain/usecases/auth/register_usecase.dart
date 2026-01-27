import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterUseCase {
  const RegisterUseCase(this.repository);

  final AuthRepository repository;

  Future<Either<AuthFailure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repository.register(name, email, password);
  }
}
