import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/init_use_case.dart';
import 'package:chat_pet/domain/usecases/user/get_me_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getMeUseCase, this._initUseCase) : super(const UserState()) {
    _init().whenComplete(getMe);
  }

  final GetMeUseCase _getMeUseCase;

  final InitUseCase _initUseCase;

  void setUser(UserModel user) {
    emit(state.copyWith(user: user, isLoading: false));
  }

  void clearUser() {
    emit(state.copyWith(user: null, isLoading: false));
  }

  Future<void> _init() async {
    await _initUseCase.call();
  }

  Future<void> getMe() async {
    final result = await _getMeUseCase.call();
    result.fold(
      (failure) => emit(state.copyWith(user: null, isLoading: false)),
      (user) {
        emit(state.copyWith(user: user, isLoading: false));
      },
    );
  }
}
