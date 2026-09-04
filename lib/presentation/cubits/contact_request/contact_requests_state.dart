part of 'contact_requests_cubit.dart';

@freezed
abstract class ContactModelRequestState with _$ContactModelRequestState {
  const factory ContactModelRequestState({
    @Default([]) List<ContactModelRequest> request,
  }) = _ContactModelRequestState;

  const ContactModelRequestState._();

  int get pendingCount => request.length;

  bool get hasPending => request.isNotEmpty;
}
