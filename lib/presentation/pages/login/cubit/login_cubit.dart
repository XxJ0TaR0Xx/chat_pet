import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  final LoginUseCase _loginUseCase;

  Future<void> login(String email, String password) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase.call(password: password, email: email);
    if (isClosed) return;
    result.fold(
      (failure) => emit(LoginState.error(failure.localize(S.current))),
      (_) => emit(const LoginState.loaded()),
    );
  }

  Future<void> loginByGoogle() async {
    emit(const LoginState.loading());
    emit(LoginState.error(S.current.NotImplemented));
    // final result = await _loginByGoogleUseCase.call();
    // result.fold(
    //   (error) => emit(LoginState.error(error.message)),
    //   (user) => emit(LoginState.loaded(user)),
    // );
  }
}
