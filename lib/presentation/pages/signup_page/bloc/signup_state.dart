part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupLoaded extends SignupState {}

final class SignupError extends SignupState {
  final String message;

  const SignupError(this.message);

  @override
  List<Object> get props => [message];
}
