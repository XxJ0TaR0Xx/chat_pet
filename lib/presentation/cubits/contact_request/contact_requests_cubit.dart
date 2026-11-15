import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';
import 'package:chat_pet/domain/usecases/contacts/accept_request_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_request_stream_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/incoming_requests_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/reject_request_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contact_requests_state.dart';
part 'contact_requests_cubit.freezed.dart';

@injectable
class ContactModelRequestsCubit extends Cubit<ContactModelRequestState> {
  ContactModelRequestsCubit(
    this._incomingRequestsUseCase,
    this._acceptRequestUseCase,
    this._rejectRequestUseCase,
    this._incomingRequestStreamUseCase,
  ) : super(const ContactModelRequestState()) {
    _listen();
    unawaited(refresh());
  }
  final IncomingRequestsUseCase _incomingRequestsUseCase;
  final AcceptRequestUseCase _acceptRequestUseCase;
  final RejectRequestUseCase _rejectRequestUseCase;
  final IncomingRequestStreamUseCase _incomingRequestStreamUseCase;

  StreamSubscription<ContactModelRequest>? _sub;
  final Set<String> _dismissedIds = {};
  int _loadVersion = 0;

  Future<void> acceptRequest(String requestId) async {
    final result = await _acceptRequestUseCase(requestId: requestId);
    result.fold(
      (failure) => talk.error('ContactModelRequestsCubit acceptRequest error: ${failure.message}'),
      (_) => _dismiss(requestId),
    );
  }

  Future<void> rejectRequest(String requestId) async {
    final result = await _rejectRequestUseCase(requestId: requestId);
    result.fold(
      (failure) => talk.error('ContactModelRequestsCubit rejectRequest error: ${failure.message}'),
      (_) => _dismiss(requestId),
    );
  }

  void _dismiss(String requestId) {
    if (isClosed) return;
    _dismissedIds.add(requestId);
    emit(
      state.copyWith(
        request: state.request.where((r) => r.id != requestId).toList(),
      ),
    );
  }

  Future<void> refresh() async {
    if (isClosed) return;
    final version = ++_loadVersion;
    final knownIds = state.request.map((request) => request.id).toSet();
    final result = await _incomingRequestsUseCase();
    if (isClosed || version != _loadVersion) return;
    result.fold(
      (failure) => talk.error('ContactModelRequestsCubit refresh error: ${failure.message}'),
      (requests) {
        // Keep pushes received while HTTP was in flight, without duplicates.
        final byId = {
          for (final request in requests)
            if (!_dismissedIds.contains(request.id)) request.id: request,
          for (final request in state.request)
            if (!knownIds.contains(request.id) && !_dismissedIds.contains(request.id)) request.id: request,
        };
        emit(state.copyWith(request: byId.values.toList()));
      },
    );
  }

  void _listen() {
    _sub = _incomingRequestStreamUseCase.call().listen(
      (request) {
        if (isClosed || _dismissedIds.contains(request.id)) return;
        final requests = {for (final item in state.request) item.id: item, request.id: request};
        emit(state.copyWith(request: requests.values.toList()));
      },
      onError: (e) => talk.error('ContactModelRequestsCubit _listen error: $e'),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
