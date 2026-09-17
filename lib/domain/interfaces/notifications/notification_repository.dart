import 'package:chat_pet/domain/models/notifications/notification_socket_event.dart';

abstract interface class NotificationRepository {
  Stream<NotificationSocketEvent> get events;
}
