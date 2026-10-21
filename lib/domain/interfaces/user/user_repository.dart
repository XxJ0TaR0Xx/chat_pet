import 'dart:async';

import 'package:chat_pet/core/common/disposable.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserRepository implements Disposable {
  Stream<UserModel?> watchCurrentUser();

  Future<Either<UserFailure, UserModel>> getMe();

  Future<Either<UserFailure, UserModel>> updateMe(UserModel user);

  Future<Either<UserFailure, UserModel>> updateAvatar(String imagePath);
}
