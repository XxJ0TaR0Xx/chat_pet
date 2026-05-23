part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserStateInitial;
  const factory UserState.loading() = UserStateLoading;
  const factory UserState.error(String errorMessage) = UserStateError;
  const factory UserState.loaded(UserModel user) = UserStateLoaded;
}
