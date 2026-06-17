import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/data/common/services/web_socket/web_socket_service.dart';
import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact.dart';
import 'package:chat_pet/domain/models/contacts/contact_request.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ContactsRepository)
class ContactsRepositoryImpl implements ContactsRepository {
  const ContactsRepositoryImpl(this._dio, this._webSocketService);

  final Dio _dio;
  final WebSocketService _webSocketService;

  @override
  Future<Either<ContactsFailure, List<UserModel>>> getContacts() async {
    try {
      talk.info('Getting my contacts');

      final response = await _dio.get('contacts/');

      final contacts = (response.data as List).map((e) => Contact.fromJson(e as Map<String, dynamic>).user).toList();

      return Right(contacts);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl searchContacts error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, List<UserModel>>> searchContacts(String userTag) async {
    try {
      talk.info('Start search contacts by $userTag');

      final response = await _dio.get(
        'contacts/search',
        queryParameters: {'q': userTag},
      );

      final contacts = (response.data as List).map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();

      return Right(contacts);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl searchContacts error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, Unit>> sendRequest(String userId) async {
    try {
      talk.info('Send request to userID $userId');

      await _dio.post('contacts/request/$userId');

      return const Right(unit);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl sendRequest error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, UserModel>> acceptRequest(String requestId) async {
    try {
      talk.info('Accept request, requestId $requestId');

      final response = await _dio.post('contacts/requests/$requestId/accept');

      final sender = ContactRequest.fromJson(response.data).sender;

      return Right(sender);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl acceptRequest error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, Unit>> rejectRequest(String requestId) async {
    try {
      talk.info('Reject request, requestId $requestId');

      await _dio.post('contacts/requests/$requestId/reject');

      return const Right(unit);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl rejectRequest error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, Unit>> deleteContacts(String contactId) async {
    try {
      talk.info('Delete contact by id, contactId $contactId');

      await _dio.delete('contacts/$contactId');

      return const Right(unit);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl deleteContacts error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ContactsFailure, List<ContactRequest>>> incomingRequest() async {
    try {
      talk.info('Get incoming request');

      final response = await _dio.get('contacts/requests/incoming');

      final contactRequests = (response.data as List).map((e) => ContactRequest.fromJson(e)).toList();

      return Right(contactRequests);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl incomingRequest error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Stream<ContactRequest> get incomingRequestStream =>
      _webSocketService.stream.where((event) => event['type'] == 'friend_request').map(ContactRequest.fromJson);
}
