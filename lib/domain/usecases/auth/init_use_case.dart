import 'dart:async';

import 'package:chat_pet/domain/interfaces/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class InitUseCase {
  const InitUseCase(this._authRepository);
  final AuthRepository _authRepository;

  FutureOr<void> call() => _authRepository.init();
}
