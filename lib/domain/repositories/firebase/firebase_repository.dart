import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class FirebaseRepository {
  Future<UserEntity?> createUser(UserEntity user, String firebaseAuthUid);

  Future<UserEntity?> getCurrentUser();

  Future<Either<UserFailures, void>> updateUser(UserEntity? user);
}
