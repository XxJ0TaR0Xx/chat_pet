import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> login(String email, String password);

  Future<Either<AuthFailure, bool>> logout(String userId);

  Future<Either<AuthFailure, UserEntity>> register(String name, String email, String password);

  //TODO think
  Future<void> checkAuthStatus(String userId);
}
