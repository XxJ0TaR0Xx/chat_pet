part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  const UserLoaded({required this.user});
  final UserModel user;

  @override
  List<Object> get props => [user];
}
