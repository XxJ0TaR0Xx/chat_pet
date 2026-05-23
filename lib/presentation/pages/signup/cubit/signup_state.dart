part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = SignupStateInitial;
  const factory SignupState.loading() = SignupStateLoading;
  const factory SignupState.loaded(UserModel user) = SignupStateLoaded;
  const factory SignupState.error(String errorMessage) = SignupStateError;
}
