import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/usecases/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@Singleton()
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.registerUseCase) : super(SignupInitial()) {
    on<SignupSubmittedEvent>(_onSignupSubmittedEvent);
  }

  final RegisterUseCase registerUseCase;

  Future<void> _onSignupSubmittedEvent(SignupSubmittedEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    final result = await registerUseCase.call(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(SignupError(failure.message)),
      (user) => emit(SignupLoaded()),
    );
  }
}
