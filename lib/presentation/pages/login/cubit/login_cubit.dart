import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@LazySingleton()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginUseCase,
  ) : super(const LoginState.initial());

  final LoginUseCase _loginUseCase;

  Future<void> login(String email, String password) async {
    emit(const LoginState.loading());

    final result = await _loginUseCase.call(password: password, email: email);
    result.fold(
      (failure) => emit(LoginState.error(failure.message)),
      (_) async {
        final userCubit = getIt<UserCubit>();
        await userCubit.getMe();
        if (userCubit.state.user == null) {
          emit(const LoginState.error('Не удалось получить пользователя'));
        }
        emit(const LoginState.loaded());
      },
    );
  }

  Future<void> loginByGoogle() async {
    emit(const LoginState.loading());
    emit(const LoginState.error('Not implemented'));
    // final result = await _loginByGoogleUseCase.call();
    // result.fold(
    //   (error) => emit(LoginState.error(error.message)),
    //   (user) => emit(LoginState.loaded(user)),
    // );
  }
}
