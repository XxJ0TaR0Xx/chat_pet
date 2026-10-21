import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/init_use_case.dart';
import 'package:chat_pet/domain/usecases/user/get_me_use_case.dart';
import 'package:chat_pet/domain/usecases/user/watch_current_user_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._getMeUseCase,
    this._initUseCase,
    WatchCurrentUserUseCase watchCurrentUserUseCase,
  ) : super(const UserState()) {
    _userSub = watchCurrentUserUseCase().listen((user) => emit(state.copyWith(user: user)));
    _init();
  }

  final GetMeUseCase _getMeUseCase;
  final InitUseCase _initUseCase;
  late final StreamSubscription<UserModel?> _userSub;

  Future<void> _init() async {
    try {
      await _initUseCase();
      await _getMeUseCase();
    } catch (e, st) {
      talk.error('User init error: $e, st $st');
    } finally {
      if (!isClosed) emit(state.copyWith(isLoading: false));
    }
  }

  @override
  Future<void> close() async {
    await _userSub.cancel();
    return super.close();
  }
}
