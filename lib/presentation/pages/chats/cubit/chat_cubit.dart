import 'package:bloc/bloc.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._userCubit) : super(ChatState.initial()) {
    getCharts();
  }

  final UserCubit _userCubit;

  Future<void> getCharts() async {
    emit(_Loading());

    emit(_Loaded());
  }
}
