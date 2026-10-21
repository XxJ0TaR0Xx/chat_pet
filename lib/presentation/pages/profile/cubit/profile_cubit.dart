import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/common/failures/failure.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/user/update_avatar_use_case.dart';
import 'package:chat_pet/domain/usecases/user/update_me_use_case.dart';
import 'package:chat_pet/domain/usecases/user/watch_current_user_use_case.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._updateMeUseCase,
    this._avatarUseCase,
    this._watchCurrentUserUseCase,
  ) : super(const ProfileState.loading()) {
    _subscription = _watchCurrentUserUseCase.call().listen(
      _onUserChanged,
    );
  }

  final UpdateMeUseCase _updateMeUseCase;
  final UpdateAvatarUseCase _avatarUseCase;
  final WatchCurrentUserUseCase _watchCurrentUserUseCase;
  late final StreamSubscription _subscription;

  Future<bool> updateMe() async {
    final currentState = state;
    if (currentState is! ProfileLoaded || currentState.isSaving) return false;

    emit(currentState.copyWith(isSaving: true));

    final result = await _updateMeUseCase.call(user: currentState.draftUser);
    if (isClosed) return false;

    return result.fold(
      (failure) {
        _emitFailure(failure);
        return false;
      },
      (newUser) {
        emit(ProfileState.loaded(originalUser: newUser, draftUser: newUser));
        return true;
      },
    );
  }

  Future<bool> updateUserImage(XFile image) async {
    final currentState = state;
    if (image.path.isEmpty || currentState is! ProfileLoaded || currentState.isSaving) return false;

    emit(currentState.copyWith(isSaving: true));

    final result = await _avatarUseCase.call(imagePath: image.path);
    if (isClosed) return false;

    return result.fold(
      (failure) {
        _emitFailure(failure);
        return false;
      },
      (_) {
        final state = this.state;
        if (state is ProfileLoaded) emit(state.copyWith(isSaving: false));
        return true;
      },
    );
  }

  void updateUserName(String newDisplayName) {
    final state = this.state;
    if (state is! ProfileLoaded) return;
    emit(state.copyWith(draftUser: state.draftUser.copyWith(name: newDisplayName)));
  }

  void updateUserAddress(String address) {
    final state = this.state;
    if (state is! ProfileLoaded) return;
    emit(state.copyWith(draftUser: state.draftUser.copyWith(address: address)));
  }

  void updateUserNumber(String number) {
    final state = this.state;
    if (state is! ProfileLoaded) return;
    emit(state.copyWith(draftUser: state.draftUser.copyWith(number: number)));
  }

  void _onUserChanged(UserModel? user) {
    if (user == null) {
      emit(ProfileState.error(S.current.CouldntFindTheUser));
      return;
    }

    final currentState = state;
    if (currentState is! ProfileLoaded) {
      emit(
        ProfileState.loaded(
          originalUser: user,
          draftUser: user,
        ),
      );
      return;
    }

    final isChanged = currentState.originalUser != currentState.draftUser;
    emit(
      currentState.copyWith(
        originalUser: user,
        draftUser: isChanged ? currentState.draftUser.copyWith(avatarUrl: user.avatarUrl) : user,
      ),
    );
  }

  void _emitFailure(Failure failure) {
    final current = state;
    if (current is! ProfileLoaded) return;

    emit(ProfileState.error(failure.localize(S.current)));
    emit(current.copyWith(isSaving: false));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
