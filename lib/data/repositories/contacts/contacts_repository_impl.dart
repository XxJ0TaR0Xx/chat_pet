import 'package:chat_pet/data/mappers/contacts/contacts_mapper.dart';
import 'package:chat_pet/data/mappers/user/user_mapper.dart';
import 'package:chat_pet/data/models/contacts/contact_dto.dart';
import 'package:chat_pet/data/models/contacts/contact_request_dto.dart';
import 'package:chat_pet/data/models/user/user_dto.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/contacts_failure/contacts_failure.dart';
import 'package:chat_pet/domain/interfaces/contacts/contacts_repository.dart';
import 'package:chat_pet/domain/interfaces/notifications/notification_repository.dart';
import 'package:chat_pet/domain/models/contacts/contact_model_request.dart';
import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ContactsRepository)
class ContactsRepositoryImpl implements ContactsRepository {
  const ContactsRepositoryImpl(this._dio, this._notificationRepository);

  final Dio _dio;
  final NotificationRepository _notificationRepository;

  @override
  Future<Either<ContactsFailure, List<UserModel>>> getContacts() async {
    try {
      talk.info('Getting my contacts');

      final response = await _dio.get('contacts/');

      final contacts = (response.data as List).map((e) => ContactDto.fromJson(e as Map<String, dynamic>).user.toDomain()).toList();

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

      final contacts = (response.data as List).map((e) => UserDto.fromJson(e as Map<String, dynamic>).toDomain()).toList();

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

      final sender = ContactModelRequestDto.fromJson(response.data).sender.toDomain();

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
  Future<Either<ContactsFailure, List<ContactModelRequest>>> incomingRequest() async {
    try {
      talk.info('Get incoming request');

      final response = await _dio.get('contacts/requests/incoming');

      final contactModelRequests = (response.data as List).map((e) {
        return ContactModelRequestDto.fromJson(e).toDomain();
      }).toList();

      return Right(contactModelRequests);
    } on DioException catch (e, st) {
      return Left(ContactsFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl incomingRequest error: $e, st $st');
      return Left(ContactsUnknownFailure(stackTrace: st));
    }
  }

  @override
  Stream<ContactModelRequest> get incomingRequestStream => _notificationRepository.events
      .where((event) => event is FriendRequestNSEvent)
      .cast<FriendRequestNSEvent>()
      .map((event) => ContactModelRequest(id: event.id, sender: event.sender));
}
