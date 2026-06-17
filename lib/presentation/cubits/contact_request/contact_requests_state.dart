part of 'contact_requests_cubit.dart';

@freezed
abstract class ContactRequestState with _$ContactRequestState {
  const factory ContactRequestState({
    @Default([]) List<ContactRequest> request,
  }) = _ContactRequestState;

  const ContactRequestState._();

  int get pendingCount => request.length;

  bool get hasPending => request.isNotEmpty;
}
