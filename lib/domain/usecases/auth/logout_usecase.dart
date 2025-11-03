import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<AuthFailure, bool>> call({required String userId}) {
    return repository.logout(userId);
  }
}
