import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/init_use_case.dart';
import 'package:chat_pet/domain/usecases/users/get_me_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getMeUseCase, this._initUseCase) : super(UserState.initial()) {
    _init().whenComplete(getMe);
  }

  final GetMeUseCase _getMeUseCase;

  final InitUseCase _initUseCase;

  static UserModel? _currentUser;

  void setUser(UserModel user) {
    _currentUser = user;
    emit(UserState.loaded(user));
  }

  void clearUser() {
    _currentUser = null;
  }

  UserModel? get currentUser => _currentUser ?? (state is UserStateLoaded ? (state as UserStateLoaded).user : null);

  Future<void> _init() async {
    await _initUseCase.call();
  }

  Future<void> getMe() async {
    emit(UserState.loading());

    final result = await _getMeUseCase.call();
    result.fold(
      (failure) => emit(UserState.error(failure.message)),
      (user) {
        _currentUser = user;
        emit(UserState.loaded(user));
      },
    );
  }
}
