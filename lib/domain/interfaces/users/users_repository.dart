import 'dart:async';

import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UsersRepository {
  Future<Either<UserFailure, UserModel>> getMe();

  Future<Either<UserFailure, UserModel>> updateMe(UserModel user);

  Future<Either<UserFailure, UserModel>> updateAvatar(String imagePath);

  Future<Either<UserFailure, UserModel>> searchUser(String userTag);
}
