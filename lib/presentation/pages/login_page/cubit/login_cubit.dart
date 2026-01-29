import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/usecases/auth/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUseCase.call(email: email, password: password);
    result.fold(
      (error) => emit(LoginError(error.message)),
      (result) {
        emit(LoginLoaded());
      },
    );
  }
}
