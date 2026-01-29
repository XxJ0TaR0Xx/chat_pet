import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial()) {
    initialize();
  }

  final _userCubit = getIt<UserCubit>();

  void initialize() {
    emit(SettingLoading());
    final user = _userCubit.currentUser;

    if (user != null) {
      emit(SettingLoaded(userModel: user));
    } else {
      emit(SettingError('Не удалось получить пользователя, пожалуйста попробуйте снова'));
    }
  }

  Future<void> updateUserImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    log('pick image $image');
  }
}
