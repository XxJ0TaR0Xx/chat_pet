import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(
    this._logoutUseCase, {
    required this.userCubit,
  }) : super(SettingState.initial()) {
    initialize();
  }
  final LogoutUseCase _logoutUseCase;
  final UserCubit userCubit;

  void initialize() {
    emit(SettingState.loading());
    final user = userCubit.currentUser;

    if (user != null) {
      emit(SettingState.loaded(user));
    } else {
      emit(SettingState.error(S.current.ErrorMsg(S.current.CouldntFindTheUser)));
    }
  }

  Future<void> logout(BuildContext context) async {
    final user = userCubit.currentUser;
    if (user != null) {
      await _logoutUseCase.call();
      userCubit.clearUser();
    } else {
      CustomSnackBar(
        context,
        text: S.of(context).ErrorMsg(S.of(context).CouldntFindTheUser),
      ).showErrorMessage();
    }
  }
}
