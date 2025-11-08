import 'dart:developer';

import 'package:chat_pet/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';

// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> checkAuthStatus(String userId) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
      }
    });
  }

  @override
  Future<Either<AuthFailure, UserEntity>> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        return Right(UserModel(
          id: credential.user!.uid,
          avatarUrl: credential.user!.photoURL,
          email: credential.user!.email,
          name: credential.user!.displayName,
        ));
      } else {
        return Left(ServerFailure());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        Left(UserNotFoundFailure());
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        Left(WrongPasswordFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<AuthFailure, bool>> logout(String userId) async {
    try {
      bool isSuccess = true;

      await FirebaseAuth.instance.signOut().onError((error, stackTrace) {
        log('Something went wrong with logout, message: $error, ST: $stackTrace');
        isSuccess = false;
      });

      return Right(isSuccess);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> register(String name, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        return Right(UserModel(
          id: credential.user!.uid,
          avatarUrl: credential.user!.photoURL,
          email: credential.user!.email,
          name: credential.user!.displayName,
        ));
      } else {
        return Left(ServerFailure());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        return Left(WrongPasswordFailure());
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        return Left(EmailAlreadyInUseFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure());
    }
    return Left(ServerFailure());
  }
}
