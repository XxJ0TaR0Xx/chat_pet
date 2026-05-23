import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/domain/usecases/users/get_me_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@Singleton()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._getMeUseCase,
    this._loginUseCase,
  ) : super(LoginState.initial());

  final GetMeUseCase _getMeUseCase;
  final LoginUseCase _loginUseCase;

  Future<void> login(String email, String password) async {
    emit(LoginState.loading());

    final result = await _loginUseCase.call(password: password, email: email);
    result.fold(
      (failure) => emit(LoginState.error(failure.message)),
      (_) async {
        final result = await _getMeUseCase.call();
        result.fold(
          (failure) => emit(LoginState.error(failure.message)),
          (user) => emit(LoginState.loaded(user)),
        );
      },
    );
  }

  Future<void> loginByGoogle() async {
    emit(LoginState.loading());
    emit(LoginState.error('Not implemented'));
    // final result = await _loginByGoogleUseCase.call();
    // result.fold(
    //   (error) => emit(LoginState.error(error.message)),
    //   (user) => emit(LoginState.loaded(user)),
    // );
  }
}
