import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/user/enum/friend_enum.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/contacts/delete_contact_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/search_contacts_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/send_request_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'find_contact_state.dart';
part 'find_contact_cubit.freezed.dart';

@injectable
class FindContactCubit extends Cubit<FindContactState> {
  FindContactCubit(
    this._searchUsersUseCase,
    this._sendRequestUseCase,
    this._deleteContactUseCase,
  ) : super(const _Loaded([]));

  final SearchContactsUseCase _searchUsersUseCase;
  final SendRequestUseCase _sendRequestUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  final List<UserModel> _lastContacts = List.empty(growable: true);
  Timer? _debouncer;

  void search(String query) {
    _debouncer?.cancel();

    final q = query.trim();

    if (q.isEmpty) {
      emit(const _Loaded([]));

      return;
    }

    _debouncer = Timer(const Duration(milliseconds: 400), () async {
      emit(const _Loading());

      final result = await _searchUsersUseCase(userTag: q);
      result.fold(
        (failure) => emit(_Error(S.current.ErrorMsg(failure.message))),
        (contacts) {
          _lastContacts.clear();
          _lastContacts.addAll(contacts);
          emit(_Loaded([..._lastContacts]));
        },
      );
    });
  }

  Future<void> sendRequest(String userId) async {
    final response = await _sendRequestUseCase.call(userId: userId);

    response.fold(
      (failure) => emit(_Error(S.current.ErrorMsg(failure.message))),
      (_) {
        final index = _lastContacts.indexWhere((contact) => contact.id == userId);
        _lastContacts[index] = _lastContacts[index].copyWith(friendshipStatus: FriendEnum.pendingSent);

        emit(_Loaded([..._lastContacts]));
      },
    );
  }

  Future<void> deleteContact(String contactId) async {
    final response = await _deleteContactUseCase.call(contactId: contactId);

    response.fold(
      (failure) => emit(_Error(S.current.ErrorMsg(failure.message))),
      (_) => {},
    );
  }

  @override
  Future<void> close() {
    _debouncer?.cancel();
    return super.close();
  }
}
