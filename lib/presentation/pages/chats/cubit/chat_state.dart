part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatStateInitial;
  const factory ChatState.loading() = ChatStateLoading;
  const factory ChatState.loaded(List<ChatModel> models) = ChatStateLoaded;
  const factory ChatState.error(String error) = ChatStateError;
}
