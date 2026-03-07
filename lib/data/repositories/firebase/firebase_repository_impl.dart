import 'dart:developer';

import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/entities/user_entity.dart';
import 'package:chat_pet/domain/failures/user_failures/user_failures.dart';
import 'package:chat_pet/domain/repositories/firebase/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  late final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final FirebaseAuth _auth = FirebaseAuth.instance;

  static const users = 'users';

  @override
  Future<UserModel?> createUser(UserEntity user, String firebaseAuthUid) async {
    final userModel = UserModel.fromEntity(user);
    await _db.collection(users).doc(firebaseAuthUid).set(userModel.toFirestore());
    return await getCurrentUser();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        log('No user is currently signed in');
        return null;
      }
      final String currentUserId = currentUser.uid;

      final userDocRef = _db.collection(users).doc(currentUserId);
      final snapshot = await userDocRef.get();

      if (snapshot.exists) {
        final userData = snapshot.data();
        if (userData != null) {
          log('Successfully fetched current user data for UID: $currentUserId');
          return UserModel.fromFirestore(snapshot, null);
        }
      }
      log('Current user document with ID $currentUserId not found in Firestore.');
      return null;
    } catch (e) {
      log('Error fetching current user: $e');
      return null;
    }
  }

  @override
  Future<Either<UserFailures, void>> updateUser(UserEntity? user) async {
    try {
      if (user == null) {
        log('Error (update user): User in the parameter is null');
        return Left(NoFindUser());
      }

      final userModel = user is UserModel ? user : UserModel.fromEntity(user);

      final userDocRef = _db.collection(users).doc(userModel.id);
      await userDocRef.update(userModel.toFirestore());

      return Right(null);
    } catch (e) {
      log('Error update user: $e');
      return Left(CantUpdateUser());
    }
  }
}
