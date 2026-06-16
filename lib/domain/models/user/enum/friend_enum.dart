import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum FriendEnum { pendingSent, pendingReceived, friends }
