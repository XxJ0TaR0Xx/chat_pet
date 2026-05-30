import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.dart';
part 'chat_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required UserCubit userCubit}) : _userCubit = userCubit, super(ChatState.initial()) {
    getCharts();
  }

  final UserCubit _userCubit;

  Future<void> getCharts() async {
    emit(_Loading());

    final user = _userCubit.currentUser;
    if (user == null) {
      emit(_Error(S.current.CouldntFindTheUser));
      return;
    }

    emit(_Loaded(user));
  }
}
