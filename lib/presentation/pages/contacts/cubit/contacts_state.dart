part of 'contacts_cubit.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.loading() = _Loading;
  const factory ContactsState.loaded(Map<String, List<UserModel>> contacts) = _Loaded;
  const factory ContactsState.error(String message) = _Error;
}
