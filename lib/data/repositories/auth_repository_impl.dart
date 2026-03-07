import 'dart:developer';

import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/auth_failures/auth_failure.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:chat_pet/domain/repositories/firebase/firebase_repository.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
//TODO add updateUser

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.firebaseRepository,
    required this.userCubit,
  });

  final FirebaseRepository firebaseRepository;
  final UserCubit userCubit;

  @override
  Future<Either<AuthFailure, UserEntity>> loadUserData(String userId) async {
    try {
      final currentUser = userCubit.currentUser;
      if (currentUser != null && currentUser.id == userId) {
        return Right(currentUser);
      }

      final user = await firebaseRepository.getCurrentUser();

      if (user == null) {
        await FirebaseAuth.instance.signOut();
        return Left(UserNotFoundFailure());
      }

      userCubit.setUser(UserModel.fromEntity(user));
      return Right(user);
    } catch (e) {
      log('[AUTH_REPO] Error loading user data: $e');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        final user = await firebaseRepository.getCurrentUser();
        if (user == null) {
          return Left(UserNotFoundFailure());
        }

        userCubit.setUser(UserModel.fromEntity(user));
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
  Future<Either<AuthFailure, UserEntity>> loginByGoogle() async {
    try {
      GoogleAuthProvider googleAuthProvide = GoogleAuthProvider();
      final userCredential = await FirebaseAuth.instance.signInWithProvider(googleAuthProvide);

      if (userCredential.user == null) {
        log('Ошибка входа через Google: userCredential.user == null');
        return Left(NotFoundUserFailure());
      }

      final firebaseUser = userCredential.user!;

      final userEmail = firebaseUser.email ?? '';
      final userName = firebaseUser.displayName ?? 'Пользователь';
      final userId = firebaseUser.uid;

      final currentUser = await firebaseRepository.getCurrentUser();

      if (currentUser == null) {
        log('Пользователь Google $userEmail не найден в Firestore');

        final newUser = UserEntity(
          id: userId,
          email: userEmail,
          name: userName,
          authProvider: 'google',
        );

        final savedUser = await firebaseRepository.createUser(newUser, userId);

        if (savedUser != null) {
          userCubit.setUser(UserModel.fromEntity(savedUser));

          return Right(
            UserEntity(
              id: savedUser.id,
              name: savedUser.name,
              email: savedUser.email,
              address: savedUser.address,
              number: savedUser.number,
            ),
          );
        } else {
          log('Не удалось сохранить пользователя в Firestore');
          return Left(NotFoundUserInFirestore());
        }
      } else {
        log('Пользователь ${currentUser.email} найден в Firestore');

        userCubit.setUser(UserModel.fromEntity(currentUser));

        return Right(
          UserEntity(
            id: currentUser.id,
            name: currentUser.name,
            email: currentUser.email,
            address: currentUser.address,
            number: currentUser.number,
          ),
        );
      }
    } catch (e) {
      log('Ошибка входа через Google: $e');
      return Left(GoogleFailure(e.toString()));
    }
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
        if (FirebaseAuth.instance.currentUser?.uid == null) {
          log('[Create User] FirebaseAuth.instance.currentUser?.uid == null');
          return Left(UserDisabledFailure());
        }

        final user = UserModel(
          id: credential.user!.uid,
          avatarUrl: credential.user!.photoURL,
          email: email,
          name: name,
          authProvider: 'email',
        );

        final correctUser = await firebaseRepository.createUser(
          user,
          FirebaseAuth.instance.currentUser!.uid,
        );

        if (correctUser == null) {
          return Left(ServerFailure());
        }
        userCubit.setUser(UserModel.fromEntity(correctUser));

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
