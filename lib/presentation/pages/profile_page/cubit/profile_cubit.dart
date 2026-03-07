import 'package:bloc/bloc.dart';
import 'package:chat_pet/data/models/user.dart';
import 'package:chat_pet/domain/usecases/user/update_user_usecase.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/profile_page/profile_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._userUseCase, {
    required this.userCubit,
  }) : super(ProfileState.initial()) {
    initialize();
  }

  final UpdateUserUseCase _userUseCase;
  final UserCubit userCubit;

  void initialize() {
    emit(ProfileState.loading());
    final user = userCubit.currentUser;

    if (user != null) {
      emit(ProfileState.loaded(user));
    } else {
      emit(ProfileState.error('Не удалось получить пользователя, пожалуйста попробуйте снова'));
    }
  }

  Future<void> updateUserName(UserContentType contentType, String newValue) async {
    if (state is _Loaded) {
      final userModelEditing = (state as _Loaded).userModel.copyWith(
        name: contentType == UserContentType.name ? newValue : null,
        address: contentType == UserContentType.adders ? newValue : null,
        number: contentType == UserContentType.phone ? newValue : null,
      );

      emit(ProfileState.loading());

      final response = await _userUseCase.call(user: userModelEditing);

      response.fold(
        (failure) => emit(ProfileState.error(failure.message)),
        (r) {
          userCubit.setUser(userModelEditing);
          emit(ProfileState.loaded(userModelEditing));
        },
      );
    }
  }
}
