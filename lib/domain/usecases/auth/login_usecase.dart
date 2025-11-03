import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<AuthFailure, UserEntity>> call({required String email, required String password}) {
    return repository.login(email, password);
  }
}
