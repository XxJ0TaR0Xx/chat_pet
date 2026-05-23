import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/pages/message_page/models/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState.initial()) {
    initChat();
  }

  void initChat() {
    emit(
      _Loaded(messages: _fakeMessage),
    );
  }

  void updateLastModel(MessageModel lastModel) {
    emit((state as _Loaded).copyWith(lastModel: lastModel));
  }

  void sendMessage(MessageModel message) {
    if (state is _Loaded) {
      emit((state as _Loaded).copyWith(lastModel: message, messages: [message, ...(state as _Loaded).messages]));
    } else {
      return;
    }
  }

  final List<MessageModel> _fakeMessage = [
    MessageModel(
      messageType: MessageType.me,
      sendDate: DateTime.now(),
      data: 'You did your job well!',
    ),
    MessageModel(
      messageType: MessageType.another,
      sendDate: DateTime.now(),
      data: 'Hope you like it',
    ),
    MessageModel(
      messageType: MessageType.date,
      sendDate: DateTime.now(),
    ),
    MessageModel(
      messageType: MessageType.another,
      sendDate: DateTime.now(),
      data: 'Have a great working week!!',
    ),
    MessageModel(
      messageType: MessageType.me,
      sendDate: DateTime.now(),
      data: 'You did your job well!',
    ),
    MessageModel(
      messageType: MessageType.date,
      sendDate: DateTime.now(),
    ),
  ].toList();
}
