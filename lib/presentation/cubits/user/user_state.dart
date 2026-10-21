part of 'user_cubit.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    UserModel? user,
    @Default(true) bool isLoading,
  }) = _UserState;
}
