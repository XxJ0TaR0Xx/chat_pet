import 'dart:async';

import 'package:chat_pet/data/common/services/web_socket/chat_web_socket.dart';
import 'package:chat_pet/data/mappers/chat/chat_mapper.dart';
import 'package:chat_pet/data/mappers/chat/chat_socket_event_mapper.dart';
import 'package:chat_pet/data/mappers/messages/message_mapper.dart';
import 'package:chat_pet/data/models/chat/chat_dto.dart';
import 'package:chat_pet/data/models/message/message_dto.dart';
import 'package:chat_pet/data/models/message/message_response_dto.dart';
import 'package:chat_pet/domain/custom_talker/custom_talker.dart';
import 'package:chat_pet/domain/failures/chat_failure/chat_failure.dart';
import 'package:chat_pet/domain/interfaces/chats/chat_repository.dart';
import 'package:chat_pet/domain/interfaces/token/token_manager.dart';
import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/domain/models/chat/chat_socket_event.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/message_model_response.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._dio, this._tokenManager);

  final Dio _dio;
  final TokenManager _tokenManager;

  ChatWebSocket? _activeSocket;
  final _messages = StreamController<MessageModel>.broadcast();

  @override
  Stream<MessageModel> watchMessages() => _messages.stream;

  static const _chatPath = 'chats';

  @override
  Future<Either<ChatFailure, ChatModel>> createChat(
    String? chatName,
    bool isGroup,
    List<String> membersIds,
  ) async {
    try {
      final response = await _dio.post(
        '$_chatPath/',
        data: {
          'name': chatName,
          'is_group': isGroup,
          'member_ids': membersIds,
        },
      );

      final chatModel = ChatDto.fromJson(response.data).toDomain();

      return Right(chatModel);
    } on DioException catch (e, st) {
      talk.error('ContactsRepositoryImpl createChat error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl createChat error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, List<ChatModel>>> getChats({
    int? offset,
    int limit = 50,
  }) async {
    try {
      final response = await _dio.get(
        '$_chatPath/',
        queryParameters: {
          'limit': limit,
          if (offset != null) 'offset': offset,
        },
      );

      final chats = (response.data as List<dynamic>).map((json) => ChatDto.fromJson(json as Map<String, dynamic>).toDomain()).toList();

      return Right(chats);
    } on DioException catch (e, st) {
      talk.error('ContactsRepositoryImpl getChats error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl getChats error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, void>> deleteChat(String chatId) async {
    try {
      await _dio.delete('$_chatPath/$chatId');

      return const Right(null);
    } on DioException catch (e, st) {
      talk.error('ContactsRepositoryImpl deleteChat error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ContactsRepositoryImpl deleteChat error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, MessageModelResponse>> getMessages(
    String chatId, {
    String? cursor,
    int limit = 50,
  }) async {
    try {
      final response = await _dio.get(
        '$_chatPath/$chatId/messages',
        queryParameters: {
          'limit': limit,
          if (cursor != null) 'cursor': cursor,
        },
      );

      final messageModelResponse = MessageModelResponseDto.fromJson(response.data).toDomain();

      return Right(messageModelResponse);
    } on DioException catch (e, st) {
      talk.error('ContactsRepositoryImpl getMessages error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ChatRepositoryImpl getMessages error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, MessageModel>> updateMessage(
    MessageModel messageModel, {
    required String chatId,
    required String messageId,
  }) async {
    try {
      final response = await _dio.patch(
        '$_chatPath/$chatId/messages/$messageId',
        data: messageModel.toUpdateDto().toJson(),
      );

      final message = MessageDto.fromJson(response.data).toDomain();

      return Right(message);
    } on DioException catch (e, st) {
      talk.error('ChatRepositoryImpl updateMessage error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ChatRepositoryImpl updateMessage error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, void>> deleteMessage(
    String chatId,
    String messageId,
    bool forEveryone,
  ) async {
    try {
      await _dio.delete(
        '$_chatPath/$chatId/messages/$messageId',
        data: {'for_everyone': forEveryone},
      );

      return const Right(null);
    } on DioException catch (e, st) {
      talk.error('ChatRepositoryImpl deleteMessage error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ChatRepositoryImpl deleteMessage error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<Either<ChatFailure, void>> deleteMessages(
    String chatId,
    List<String> messageIds,
    bool forEveryone,
  ) async {
    try {
      await _dio.delete(
        '$_chatPath/$chatId/messages',
        data: {
          'message_ids': messageIds,
          'for_everyone': forEveryone,
        },
      );

      return const Right(null);
    } on DioException catch (e, st) {
      talk.error('ChatRepositoryImpl getMessages error: $e, st $st');
      return Left(ChatFailure.fromDioException(e, st));
    } catch (e, st) {
      talk.error('ChatRepositoryImpl getMessages error: $e, st $st');
      return Left(ChatUnknownFailure(stackTrace: st));
    }
  }

  @override
  Future<void> readMessages(String chatId) async {
    try {
      await _dio.post('$_chatPath/$chatId/read');
    } on DioException catch (e, st) {
      talk.error('ChatRepositoryImpl DioException readMessages error: $e, st $st');
    } catch (e, st) {
      talk.error('ChatRepositoryImpl readMessages error: $e, st $st');
    }
  }

  @override
  Stream<ChatSocketEvent> connectToChat(String chatId) {
    _activeSocket?.dispose();
    talk.info('Connect to chat $chatId');
    final socket = ChatWebSocket(_tokenManager)..connect(chatId);
    _activeSocket = socket;

    return socket.stream
        .map((json) {
          final event = chatSocketEventFromJson(json);
          if (event is IncomingMessageEvent && !_messages.isClosed) {
            _messages.add(event.message);
          }
          return event;
        })
        .where((event) => event != null)
        .cast<ChatSocketEvent>();
  }

  @override
  void disconnectFromChat() {
    talk.info('Close chat connection');
    _activeSocket?.dispose();
    _activeSocket = null;
  }

  @disposeMethod
  @override
  Future<void> dispose() async {
    disconnectFromChat();
    await _messages.close();
  }

  @override
  void sendMessage(
    String chatId, {
    required String content,
    ContentType contentType = ContentType.text,
    String? replyToId,
  }) {
    _activeSocket?.sendMessage({
      'content': content,
      'content_type': contentType.name,
      if (replyToId != null) 'reply_to_id': replyToId,
    });
  }
}
