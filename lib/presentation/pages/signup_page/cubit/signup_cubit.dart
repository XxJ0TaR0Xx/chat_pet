import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/usecases/auth/register_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._registerUseCase) : super(SignupState.initial());

  final RegisterUseCase _registerUseCase;

  Future<void> onSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupState.loading());

    final result = await _registerUseCase.call(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignupState.error(failure.message)),
      (user) => emit(SignupState.loaded()),
    );
  }
}
