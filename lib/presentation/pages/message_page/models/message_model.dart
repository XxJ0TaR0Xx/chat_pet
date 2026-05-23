import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  const MessageModel({
    required this.messageType,
    required this.sendDate,
    this.data,
  });

  @override
  final MessageType messageType;
  @override
  final String? data;
  @override
  final DateTime sendDate;
}

enum MessageType { me, another, audioMe, audioAnother, date }
