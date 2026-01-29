import 'dart:developer';

import 'package:chat_pet/core/firebase/storage/firebase_db.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<void> checkAuthStatus(String userId) async {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {}
    // });
  }

  @override
  Future<Either<AuthFailure, UserEntity>> loadUserData(String userId) async {
    try {
      final userCubit = getIt<UserCubit>();
      final FirebaseDB firebaseDB = FirebaseDB();

      final currentUser = userCubit.currentUser;
      if (currentUser != null && currentUser.id == userId) {
        return Right(currentUser);
      }

      final user = await firebaseDB.getCurrentUser();

      if (user == null) {
        return Left(UserNotFoundFailure());
      }

      userCubit.setUser(user);
      return Right(user);
    } catch (e) {
      log('[AUTH_REPO] Error loading user data: $e');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> login(String email, String password) async {
    try {
      final FirebaseDB firebaseDB = FirebaseDB();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        final user = await firebaseDB.getCurrentUser();
        if (user == null) return Left(ServerFailure());

        getIt<UserCubit>().setUser(user);
        return Right(user);
      } else {
        return Left(ServerFailure());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('[AUTH_REPO] No user found for that email.');
        return Left(UserNotFoundFailure());
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        log('[AUTH_REPO] Wrong password provided for that user.');
        return Left(WrongPasswordFailure());
      }
    } catch (e, stackTrace) {
      log('[AUTH_REPO] GENERAL ERROR (Not FirebaseAuthException): $e', error: e, stackTrace: stackTrace);
      return Left(ServerFailure());
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
    final FirebaseDB firebaseDB = FirebaseDB();

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        if (FirebaseAuth.instance.currentUser?.uid == null) {
          log('[Create User] FirebaseAuth.instance.currentUser?.uid == null');
          return Left(UserDisabledFailure());
        }

        final user = UserModel(
          id: credential.user!.uid,
          avatarUrl: credential.user!.photoURL,
          email: credential.user!.email,
          name: credential.user!.displayName,
        );

        final correctUser = await firebaseDB.createUser(user, FirebaseAuth.instance.currentUser!.uid);
        if (correctUser == null) return Left(ServerFailure());
        getIt<UserCubit>().setUser(correctUser);

        return Right(correctUser);
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
