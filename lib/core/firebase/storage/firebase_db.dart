import 'dart:developer';

import 'package:chat_pet/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const users = 'users';

  Future<UserModel?> createUser(UserModel user, String firebaseAuthUid) async {
    await _db.collection(users).doc(firebaseAuthUid).set(user.toFirestore());
    return await getCurrentUser();
  }

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
}
