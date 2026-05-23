import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/users/update_avatar_use_case.dart';
import 'package:chat_pet/domain/usecases/users/update_me_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._updateMeUseCase,
    this._avatarUseCase, {
    required this.userCubit,
  }) : super(ProfileState.initial()) {
    initialize();
  }

  final UpdateMeUseCase _updateMeUseCase;
  final UpdateAvatarUseCase _avatarUseCase;
  final UserCubit userCubit;

  UserModel? get user => userCubit.currentUser;

  void initialize() {
    emit(ProfileState.loading());
    if (user != null) {
      emit(ProfileState.loaded(user!));
    } else {
      emit(ProfileState.error('Не удалось получить пользователя, пожалуйста попробуйте снова'));
    }
  }

  Future<bool> updateMe(UserModel editingUser) async {
    bool isSuccess = false;

    emit(ProfileState.loading());

    final result = await _updateMeUseCase.call(user: editingUser);

    result.fold(
      (failure) {
        emit(ProfileState.error(failure.message));
        isSuccess = false;
      },
      (newUser) {
        userCubit.setUser(newUser);
        emit(ProfileState.loaded(newUser));
        isSuccess = true;
      },
    );

    return isSuccess;
  }

  Future<bool> updateUserImage() async {
    bool isSuccess = false;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image?.path == null || image!.path.isEmpty) return isSuccess;

    final result = await _avatarUseCase.call(imagePath: image.path);

    result.fold(
      (failure) {
        emit(ProfileState.error(failure.message));
        isSuccess = false;
      },
      (newUser) {
        userCubit.setUser(newUser);
        emit(ProfileState.loaded(newUser));
        isSuccess = true;
      },
    );

    return isSuccess;
  }
}
