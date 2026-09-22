import 'package:bouncy_effect/bouncy_effect.dart';
import 'package:chat_pet/domain/models/chat/chat_member_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_bubble.dart';
import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageListItem extends StatelessWidget {
  const MessageListItem._({
    required this.model,
    required this.prevModel,
    required this.currentUser,
    required this.interlocutor,
    this.isMenuMessage = false,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.readCursor,
    this.resolveReadStatus,
  });

  factory MessageListItem.menu({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    MessageModel? prevModel,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    prevModel: prevModel,
    isMenuMessage: true,
  );

  factory MessageListItem.chat({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    MessageModel? prevModel,
    ValueListenable<List<ChatMemberModel>>? readCursor,
    MessageReadStatus Function(MessageModel message)? resolveReadStatus,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    prevModel: prevModel,
    readCursor: readCursor,
    resolveReadStatus: resolveReadStatus,
  );

  factory MessageListItem.selectionMode({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    required bool isSelected,
    MessageModel? prevModel,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    isSelected: isSelected,
    prevModel: prevModel,
    isSelectionMode: true,
  );

  final MessageModel model;
  final MessageModel? prevModel;
  final UserModel currentUser;
  final UserModel interlocutor;
  final bool isMenuMessage;
  final bool isSelectionMode;
  final bool isSelected;
  final ValueListenable<List<ChatMemberModel>>? readCursor;
  final MessageReadStatus Function(MessageModel message)? resolveReadStatus;

  bool get _isFirstInGroup =>
      model.messageSender == MessageSender.another && (prevModel == null || prevModel!.messageSender != MessageSender.another);

  double get _bottomPadding => isMenuMessage
      ? SpacingFoundation.verticalSpacing4
      : prevModel?.messageSender == model.messageSender
      ? SpacingFoundation.verticalSpacing10
      : SpacingFoundation.verticalSpacing20;

  bool get _showDateHeader => prevModel == null || !model.createAt.isSameDay(prevModel!.createAt);

  @override
  Widget build(BuildContext context) {
    return isSelectionMode
        ? _selectionModeItem().paddingOnly(right: SpacingFoundation.horizontalSpacing16)
        : _defaultItem().paddingHorizontal(SpacingFoundation.horizontalSpacing16);
  }

  Widget _defaultItem() {
    final messageWidget = switch (model.messageSender) {
      MessageSender.me => MessageBubble.defaultMode(
        author: currentUser,
        message: model,
        readCursor: readCursor,
        resolveReadStatus: resolveReadStatus,
      ).paddingOnly(bottom: _bottomPadding),
      MessageSender.another => MessageBubble.defaultMode(
        author: interlocutor,
        message: model,
        isFirstInGroup: _isFirstInGroup,
      ).paddingOnly(bottom: _bottomPadding),
    };

    if (!_showDateHeader || isMenuMessage) return BouncyEffect(child: messageWidget);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DateSeparator(date: model.createAt).paddingOnly(bottom: SpacingFoundation.verticalSpacing12),
        BouncyEffect(child: messageWidget),
      ],
    );
  }

  Widget _selectionModeItem() {
    final messageWidget = switch (model.messageSender) {
      MessageSender.me => MessageBubble.selectionMode(
        author: currentUser,
        message: model,
        isSelected: isSelected,
      ).paddingOnly(bottom: _bottomPadding),
      MessageSender.another => MessageBubble.selectionMode(
        author: interlocutor,
        message: model,
        isSelected: isSelected,
        isFirstInGroup: _isFirstInGroup,
      ).paddingOnly(bottom: _bottomPadding),
    };

    if (!_showDateHeader) return messageWidget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DateSeparator(date: model.createAt).paddingOnly(bottom: SpacingFoundation.verticalSpacing12),
        messageWidget,
      ],
    );
  }
}

class _DateSeparator extends StatelessWidget {
  const _DateSeparator({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: theme?.colorScheme.inversePrimary,
          ),
          child: Text(
            date.isToday ? S.of(context).Today : DateFormat('d MMMM').format(date),
            style: theme?.carosTextTheme.mediumBold12,
          ).paddingAll(EdgeInsetsFoundation.all6),
        ),
      ],
    );
  }
}
