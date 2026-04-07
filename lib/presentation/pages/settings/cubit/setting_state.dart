part of 'setting_cubit.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.loading() = _Loading;
  const factory SettingState.loaded(UserModel? userModel) = _Loaded;
  const factory SettingState.error(String errorMessage) = _Error;
}
