import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/firebase/storage/firebase_db.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@Singleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserModel? _user;

  UserModel? get getUser => _user;

  set setUser(UserModel user) => _user = user;

  Future<UserModel?> getUserFromServer() async {
    final FirebaseDB firebaseDB = FirebaseDB();

    return await firebaseDB.getCurrentUser();
  }
}
