import 'package:bloc/bloc.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/contacts/delete_contact_use_case.dart';
import 'package:chat_pet/domain/usecases/contacts/get_contacts_use_case.dart';
import 'package:chat_pet/presentation/utils/failure_localization/failure_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contacts_state.dart';
part 'contacts_cubit.freezed.dart';

@injectable
class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(
    this._getContactsUseCase,
    this._deleteContactUseCase,
  ) : super(const ContactsState.loading()) {
    _loadContacts();
  }

  final GetContactsUseCase _getContactsUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  List<UserModel> _allContacts = [];

  Future<void> deleteContact(String contactId) async {
    final result = await _deleteContactUseCase.call(contactId: contactId);

    result.fold(
      (failure) {
        emit(_Error(failure.localize(S.current)));
      },
      (_) {
        _allContacts.removeWhere((contact) => contact.id == contactId);
        emit(_Loaded(_groupByLetter(_allContacts)));
      },
    );
  }

  void searchContacts(String query) {
    final q = query.trim().toLowerCase();
    final filtered = q.isEmpty ? _allContacts : _allContacts.where((u) => u.nameAndLast.toLowerCase().contains(q)).toList();
    emit(ContactsState.loaded(_groupByLetter(filtered)));
  }

  void clearSearch() {
    emit(ContactsState.loaded(_groupByLetter(_allContacts)));
  }

  Future<void> _loadContacts() async {
    emit(const ContactsState.loading());
    final result = await _getContactsUseCase();
    result.fold(
      (failure) => emit(ContactsState.error(failure.localize(S.current))),
      (contacts) {
        _allContacts = contacts;
        emit(ContactsState.loaded(_groupByLetter(contacts)));
      },
    );
  }

  Future<void> refresh() => _loadContacts();

  static Map<String, List<UserModel>> _groupByLetter(List<UserModel> contacts) {
    final sorted = [...contacts]..sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    final result = <String, List<UserModel>>{};
    for (final user in sorted) {
      final letter = (user.name?.isNotEmpty ?? false) ? user.name![0].toUpperCase() : '#';
      result.putIfAbsent(letter, () => []).add(user);
    }
    return result;
  }
}
