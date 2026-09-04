import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/user/update_avatar_use_case.dart';
import 'package:chat_pet/domain/usecases/user/update_me_use_case.dart';
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
  }) : super(const ProfileState.initial()) {
    initialize();
  }

  final UpdateMeUseCase _updateMeUseCase;
  final UpdateAvatarUseCase _avatarUseCase;
  final UserCubit userCubit;

  UserModel? get user => userCubit.state.user;

  void initialize() {
    emit(const ProfileState.loading());
    if (user != null) {
      emit(ProfileState.loaded(user!));
    } else {
      emit(const ProfileState.error('Не удалось получить пользователя, пожалуйста попробуйте снова'));
    }
  }

  Future<bool> updateMe(UserModel editingUser) async {
    bool isSuccess = false;

    emit(const ProfileState.loading());

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
    final image = await _getImage();

    if (image?.path == null || image!.path.isEmpty) return isSuccess;

    emit(const ProfileState.loading());

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

  Future<XFile?> _getImage() async {
    final ImagePicker picker = ImagePicker();
    return picker.pickImage(source: ImageSource.gallery);
  }
}
