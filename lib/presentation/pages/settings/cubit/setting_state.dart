part of 'setting_cubit.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.loading() = SettingStateLoading;
  const factory SettingState.loaded(
    UserModel userModel, {
    @Default(null) String? transientError,
  }) = SettingStateLoaded;
  const factory SettingState.error(String errorMessage) = SettingStateError;
}
