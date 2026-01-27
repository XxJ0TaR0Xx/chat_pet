part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingLoaded extends SettingState {
  const SettingLoaded({
    this.userModel,
  });

  final UserModel? userModel;
}

final class SettingError extends SettingState {
  const SettingError(this.errorMessage);

  final String errorMessage;
}
