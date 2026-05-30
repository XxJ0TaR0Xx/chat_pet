import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({
    required LogoutUseCase logoutUseCase,
    required UserCubit userCubit,
  }) : _logoutUseCase = logoutUseCase,
       _userCubit = userCubit,
       super(SettingState.initial()) {
    initialize();
  }
  final LogoutUseCase _logoutUseCase;
  final UserCubit _userCubit;

  void initialize() {
    emit(SettingState.loading());
    final user = _userCubit.currentUser;

    if (user != null) {
      emit(SettingState.loaded(user));
    } else {
      emit(SettingState.error(S.current.ErrorMsg(S.current.CouldntFindTheUser)));
    }
  }

  Future<void> logout() async {
    final user = _userCubit.currentUser;
    if (user == null) {
      emit(SettingState.error(S.current.CouldntFindTheUser));
      return;
    }

    emit(SettingState.loading());

    try {
      await _logoutUseCase.call();
      _userCubit.clearUser();
    } catch (e, st) {
      talk.error('Logout error: $e: StackTrace: $st');
      emit(SettingState.loaded(user, transientError: S.current.SomethingWentWrong));
    }
  }
}
