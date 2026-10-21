import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/domain/usecases/user/watch_current_user_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  SettingCubit(
    this._logoutUseCase,
    this._watchCurrentUserUseCase,
  ) : super(const SettingState.loading()) {
    _userSub = _watchCurrentUserUseCase.call().listen(_updateUser);
  }

  final LogoutUseCase _logoutUseCase;
  final WatchCurrentUserUseCase _watchCurrentUserUseCase;
  late final StreamSubscription<UserModel?> _userSub;

  @override
  Future<void> close() async {
    await _userSub.cancel();
    return super.close();
  }

  Future<void> logout() async {
    final state = this.state;
    if (state is! SettingStateLoaded) return;

    emit(const SettingState.loading());

    try {
      await _logoutUseCase.call();
    } catch (e, st) {
      talk.error('Logout error: $e: StackTrace: $st');
      emit(SettingState.loaded(state.userModel, transientError: S.current.SomethingWentWrong));
    }
  }

  void _updateUser(UserModel? user) {
    if (user == null) {
      emit(const SettingState.loading());
      return;
    }

    emit(SettingState.loaded(user));
  }
}
