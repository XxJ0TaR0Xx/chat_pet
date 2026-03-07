import 'package:bloc/bloc.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@Singleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());

  UserModel? _currentUser;

  void setUser(UserModel user) {
    _currentUser = user;
    emit(UserState.loaded(user));
  }

  void clearUser() {
    _currentUser = null;
  }

  UserModel? get currentUser => _currentUser ?? (state is UserStateLoaded ? (state as UserStateLoaded).user : null);
}
