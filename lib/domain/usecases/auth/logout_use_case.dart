import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LogoutUseCase {
  const LogoutUseCase(this._authRepositoryImpl);
  final AuthRepository _authRepositoryImpl;

  Future<void> call() async => _authRepositoryImpl.logout();
}
