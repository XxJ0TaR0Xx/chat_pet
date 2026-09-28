import 'package:bouncy_effect/bouncy_effect.dart';
import 'package:chat_pet/domain/models/chat/chat_member_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/pages/message_page/models/reply_preview.dart';
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
    required this.authorNameOf,
    this.isMenuMessage = false,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.readCursor,
    this.resolveReadStatus,
    this.onSwipe,
  });

  factory MessageListItem.menu({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    required AuthorNameResolver authorNameOf,
    MessageModel? prevModel,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    prevModel: prevModel,
    authorNameOf: authorNameOf,
    isMenuMessage: true,
  );

  factory MessageListItem.chat({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    required AuthorNameResolver authorNameOf,
    MessageModel? prevModel,
    ValueListenable<List<ChatMemberModel>>? readCursor,
    MessageReadStatus Function(MessageModel message)? resolveReadStatus,
    VoidCallback? onSwipe,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    prevModel: prevModel,
    authorNameOf: authorNameOf,
    readCursor: readCursor,
    resolveReadStatus: resolveReadStatus,
    onSwipe: onSwipe,
  );

  factory MessageListItem.selectionMode({
    required MessageModel model,
    required UserModel currentUser,
    required UserModel interlocutor,
    required bool isSelected,
    required AuthorNameResolver authorNameOf,
    MessageModel? prevModel,
  }) => MessageListItem._(
    model: model,
    currentUser: currentUser,
    interlocutor: interlocutor,
    isSelected: isSelected,
    prevModel: prevModel,
    authorNameOf: authorNameOf,
    isSelectionMode: true,
  );

  final MessageModel model;
  final MessageModel? prevModel;
  final AuthorNameResolver authorNameOf;
  final UserModel currentUser;
  final UserModel interlocutor;
  final bool isMenuMessage;
  final bool isSelectionMode;
  final bool isSelected;
  final ValueListenable<List<ChatMemberModel>>? readCursor;
  final MessageReadStatus Function(MessageModel message)? resolveReadStatus;
  final VoidCallback? onSwipe;

  bool get _isFirstInGroup =>
      model.messageSender == MessageSender.another && (prevModel == null || prevModel!.messageSender != MessageSender.another);

  double get _bottomPadding => isMenuMessage ? SpacingFoundation.verticalSpacing4 : SpacingFoundation.verticalSpacing10;

  ReplyPreview? get _replyPreview => ReplyPreview.of(model, authorNameOf);

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
        reply: _replyPreview,
        resolveReadStatus: resolveReadStatus,
      ).paddingOnly(bottom: _bottomPadding),
      MessageSender.another => MessageBubble.defaultMode(
        author: interlocutor,
        message: model,
        reply: _replyPreview,
        isFirstInGroup: _isFirstInGroup,
      ).paddingOnly(bottom: _bottomPadding),
    };

    final bouncyMessage = BouncyEffect(child: messageWidget);
    if (isMenuMessage) return bouncyMessage;

    final onSwipe = this.onSwipe;
    final swipeableMessage = onSwipe == null ? bouncyMessage : _BoundedSwipeGesture(onSwipe: onSwipe, child: bouncyMessage);

    if (!_showDateHeader) return swipeableMessage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DateSeparator(date: model.createAt).paddingOnly(bottom: SpacingFoundation.verticalSpacing12),
        swipeableMessage,
      ],
    );
  }

  Widget _selectionModeItem() {
    final messageWidget = switch (model.messageSender) {
      MessageSender.me => MessageBubble.selectionMode(
        author: currentUser,
        message: model,
        isSelected: isSelected,
        reply: _replyPreview,
      ).paddingOnly(bottom: _bottomPadding),
      MessageSender.another => MessageBubble.selectionMode(
        author: interlocutor,
        message: model,
        isSelected: isSelected,
        reply: _replyPreview,
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

class _BoundedSwipeGesture extends StatefulWidget {
  const _BoundedSwipeGesture({
    required this.child,
    required this.onSwipe,
  });

  final Widget child;
  final VoidCallback onSwipe;

  @override
  State<_BoundedSwipeGesture> createState() => _BoundedSwipeGestureState();
}

class _BoundedSwipeGestureState extends State<_BoundedSwipeGesture> with SingleTickerProviderStateMixin {
  static const _maxDragExtent = 64.0;

  /// Доля от [_maxDragExtent], после которой отпускание пальца вызывает onSwipe.
  static const _triggerFraction = 0.75;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    lowerBound: -_maxDragExtent,
    upperBound: _maxDragExtent,
    value: 0,
    duration: const Duration(milliseconds: 180),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isTriggered => _controller.value.abs() >= _maxDragExtent * _triggerFraction;

  // AnimationController сам клампит value по lowerBound/upperBound.
  void _onDragUpdate(DragUpdateDetails details) => _controller.value += details.delta.dx;

  void _onDragEnd(DragEndDetails _) {
    if (_isTriggered) widget.onSwipe();
    _snapBack();
  }

  void _snapBack() => _controller.animateTo(0, curve: Curves.easeOutCubic);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragCancel: _snapBack,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.translate(offset: Offset(_controller.value, 0), child: child),
        child: widget.child,
      ),
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
