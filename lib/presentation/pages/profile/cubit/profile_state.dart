part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({
    required UserModel originalUser,
    required UserModel draftUser,
    @Default(false) bool isSaving,
  }) = ProfileLoaded;
  const factory ProfileState.error(String errorMessage) = ProfileError;
}
