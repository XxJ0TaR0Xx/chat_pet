import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/interfaces/registration/registration_repository.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegistrationUseCase {
  const RegistrationUseCase(this._registrationRepository);
  final RegistrationRepository _registrationRepository;

  Future<Either<AuthFailure, UserModel>> call({
    required String email,
    required String userName,
    required String password,
  }) async {
    if (email.isEmpty || userName.isEmpty || password.isEmpty) return Future.value(Left(ValidationFailure(stackTrace: StackTrace.current)));
    return _registrationRepository.registration(userName, email, password);
  }
}
