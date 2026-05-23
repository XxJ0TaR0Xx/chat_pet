import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RegistrationRepository {
  Future<Either<AuthFailure, UserModel>> registration(String userName, String email, String password);
}
