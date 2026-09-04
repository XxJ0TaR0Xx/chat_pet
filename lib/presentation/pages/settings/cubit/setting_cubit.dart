import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  SettingCubit(LogoutUseCase logoutUseCase, UserCubit userCubit)
    : _logoutUseCase = logoutUseCase,
      _userCubit = userCubit,
      super(const SettingState.initial()) {
    initialize();
    _userSub = userCubit.stream.listen((userState) {
      if (userState.user != null) initialize();
    });
  }

  final LogoutUseCase _logoutUseCase;
  final UserCubit _userCubit;
  late final StreamSubscription<UserState> _userSub;

  UserModel? get user => _userCubit.state.user;

  void initialize() {
    emit(const SettingState.loading());
    final user = this.user;
    if (user != null) {
      emit(SettingState.loaded(user));
    } else {
      emit(SettingState.error(S.current.ErrorMsg(S.current.CouldntFindTheUser)));
    }
  }

  @override
  Future<void> close() {
    _userSub.cancel();
    return super.close();
  }

  Future<void> logout() async {
    final user = this.user;
    if (user == null) {
      emit(SettingState.error(S.current.CouldntFindTheUser));
      return;
    }

    emit(const SettingState.loading());

    try {
      await _logoutUseCase.call();
      _userCubit.clearUser();
    } catch (e, st) {
      talk.error('Logout error: $e: StackTrace: $st');
      emit(SettingState.loaded(user, transientError: S.current.SomethingWentWrong));
    }
  }
}
