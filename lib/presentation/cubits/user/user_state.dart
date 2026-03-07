part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserStateInitial;
  const factory UserState.loaded(UserModel user) = UserStateLoaded;
}
