import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/domain/usecases/auth/registration_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._registrationUseCase, this._loginUseCase) : super(SignupState.initial());

  final RegistrationUseCase _registrationUseCase;
  final LoginUseCase _loginUseCase;

  Future<void> onSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupState.loading());

    final result = await _registrationUseCase.call(
      userName: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignupState.error(failure.message)),
      (user) async {
        final result = await _loginUseCase.call(email: email, password: password);
        result.fold(
          (failure) => emit(SignupState.error(failure.message)),
          (_) => emit(SignupState.loaded(user)),
        );
      },
    );
  }
}
