import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/usecases/auth/logout_usecase.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> updateUserImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    log('pick image $image');
  }

  Future<bool> logout(BuildContext context) async {
    final user = userCubit.currentUser;
    if (user != null) {
      final result = await _logoutUseCase.call(userId: user.id);
      bool canExist = false;

      result.fold(
        (fail) {
          CustomSnackBar(
            context,
            text: S.of(context).ErrorMsg(fail.message),
          ).showErrorMessage();
          canExist = false;
        },
        (result) {
          canExist = result;
        },
      );
      if (canExist) userCubit.clearUser();

      return canExist;
    } else {
      CustomSnackBar(
        context,
        text: S.of(context).ErrorMsg(S.of(context).CouldntFindTheUser),
      ).showErrorMessage();
      return false;
    }
  }
}
