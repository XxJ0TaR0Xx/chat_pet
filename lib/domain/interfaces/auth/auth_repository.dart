import 'dart:async';

import 'package:chat_pet/core/auth/interface/logoutable.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository implements Logoutable {
  FutureOr<void> init();

  Future<Either<AuthFailure, void>> login({
    required String email,
    required String password,
  });

  Future<String> refreshTokens();
}
