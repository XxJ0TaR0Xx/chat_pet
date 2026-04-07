part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginStateInitial;
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.loaded() = LoginStateLoaded;
  const factory LoginState.error(String errorMessage) = LoginStateError;
}
