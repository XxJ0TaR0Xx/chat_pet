import 'package:bloc/bloc.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@Singleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(UserModel user) {
    emit(UserLoaded(user: user));
  }

  void clearUser() {
    emit(UserInitial());
  }

  UserModel? get currentUser {
    return state is UserLoaded ? (state as UserLoaded).user : null;
  }
}
