part of 'find_contact_cubit.dart';

@freezed
class FindContactState with _$FindContactState {
  const factory FindContactState.loading() = _Loading;
  const factory FindContactState.loaded(List<UserModel> contacts) = _Loaded;
  const factory FindContactState.error(String errorMessage) = _Error;
}
