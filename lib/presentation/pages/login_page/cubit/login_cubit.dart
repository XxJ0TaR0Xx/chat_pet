import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/usecases/auth/login_by_google_usecase.dart';
import 'package:chat_pet/domain/usecases/auth/login_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase, this._loginByGoogleUseCase) : super(LoginState.initial());

  final LoginUseCase _loginUseCase;
  final LoginByGoogleUseCase _loginByGoogleUseCase;

  Future<void> login(String email, String password) async {
    emit(LoginState.loading());
    final result = await _loginUseCase.call(email: email, password: password);
    result.fold(
      (error) => emit(LoginState.error(error.message)),
      (result) {
        emit(LoginState.loaded());
      },
    );
  }

  Future<void> loginByGoogle() async {
    emit(LoginState.loading());
    final result = await _loginByGoogleUseCase.call();
    result.fold(
      (error) => emit(LoginState.error(error.message)),
      (result) {
        emit(LoginState.loaded());
      },
    );
  }
}
