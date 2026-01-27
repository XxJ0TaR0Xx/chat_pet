import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LogoutUseCase {
  const LogoutUseCase(this.repository);

  final AuthRepository repository;

  Future<Either<AuthFailure, bool>> call({required String userId}) {
    return repository.logout(userId);
  }
}
