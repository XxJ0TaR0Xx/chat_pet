import 'package:chat_pet/data/common/services/web_socket/notification_web_socket.dart';
import 'package:chat_pet/domain/interfaces/notifications/notification_repository.dart';
import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._notificationWebSocket);

  final NotificationWebSocket _notificationWebSocket;

  @override
  Stream<NotificationSocketEvent> get events => _notificationWebSocket.events;
}
