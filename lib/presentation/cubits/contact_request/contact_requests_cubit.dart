import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:chat_pet/domain/usecases/contacts/accept_request_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_request_stream_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_requests_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/reject_request_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contact_requests_state.dart';
part 'contact_requests_cubit.freezed.dart';

@lazySingleton
class ContactRequestsCubit extends Cubit<ContactRequestState> {
  ContactRequestsCubit(
    this._incomingRequestsUseCase,
    this._acceptRequestUseCase,
    this._rejectRequestUseCase,
    this._incomingRequestStreamUseCase,
  ) : super(ContactRequestState()) {
    _init();
    _listen();
  }
  final IncomingRequestsUseCase _incomingRequestsUseCase;
  final AcceptRequestUseCase _acceptRequestUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final IncomingRequestStreamUseCase _incomingRequestStreamUseCase;

  StreamSubscription<ContactRequest>? _sub;

  Future<void> acceptRequest(String requestId) async {
    final result = await _acceptRequestUseCase(requestId: requestId);
    result.fold(
      (failure) => talk.error('ContactRequestsCubit acceptRequest error: ${failure.message}'),
      (_) => _dismiss(requestId),
    );
  }

  Future<void> rejectRequest(String requestId) async {
    final result = await _rejectRequestUseCase(requestId: requestId);
    result.fold(
      (failure) => talk.error('ContactRequestsCubit rejectRequest error: ${failure.message}'),
      (_) => _dismiss(requestId),
    );
  }

  void _dismiss(String requestId) {
    emit(
      state.copyWith(
        request: state.request.where((r) => r.id != requestId).toList(),
      ),
    );
  }

  void _init() {
    _incomingRequestsUseCase.call().then(
      (result) => result.fold(
        (failure) => talk.error('ContactRequestsCubit _init error: ${failure.message} StackTrace: ${failure.stackTrace}'),
        (requests) => emit(state.copyWith(request: requests)),
      ),
    );
  }

  void _listen() {
    _sub = _incomingRequestStreamUseCase.call().listen(
      (request) => emit(state.copyWith(request: [...state.request, request])),
      onError: (e) => talk.error('ContactRequestsCubit _listen error: $e'),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
