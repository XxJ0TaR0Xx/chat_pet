import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/models/chat/chat_member_model.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/messages/reply_to_message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/models/reply_preview.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_render_object.dart';
import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';

const _bubbleRadius = 16.0;

class MessageBubble extends StatelessWidget {
  const MessageBubble._({
    required this.message,
    required this.author,
    this.reply,
    this.isFirstInGroup = false,
    this.isGroup = false,
    this.isSelectingMode = false,
    this.isSelected = false,
    this.readCursor,
    this.resolveReadStatus,
    super.key,
  });

  factory MessageBubble.defaultMode({
    required MessageModel message,
    required UserModel author,
    ReplyPreview? reply,
    bool isFirstInGroup = false,
    bool isGroup = false,
    ValueListenable<List<ChatMemberModel>>? readCursor,
    MessageReadStatus Function(MessageModel message)? resolveReadStatus,
    Key? key,
  }) => MessageBubble._(
    message: message,
    author: author,
    reply: reply,
    isFirstInGroup: isFirstInGroup,
    isGroup: isGroup,
    readCursor: readCursor,
    resolveReadStatus: resolveReadStatus,
    key: key,
  );

  factory MessageBubble.selectionMode({
    required MessageModel message,
    required UserModel author,
    required bool isSelected,
    ReplyPreview? reply,
    bool isFirstInGroup = false,
    bool isGroup = false,
    Key? key,
  }) => MessageBubble._(
    message: message,
    author: author,
    reply: reply,
    isSelected: isSelected,
    isFirstInGroup: isFirstInGroup,
    isGroup: isGroup,
    isSelectingMode: true,
    key: key,
  );

  final MessageModel message;
  final UserModel author;
  final ReplyPreview? reply;

  final bool isFirstInGroup;
  final bool isGroup;

  final bool isSelectingMode;
  final bool isSelected;

  /// Курсор прочтения собеседника(-ов) — null, если статус не отслеживается
  /// (превью сообщения в контекстном меню, режим выбора).
  final ValueListenable<List<ChatMemberModel>>? readCursor;
  final MessageReadStatus Function(MessageModel message)? resolveReadStatus;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    final isMe = author.id == getIt<UserCubit>().state.user!.id;

    if (isSelectingMode) {
      return Row(
        mainAxisAlignment: isMe ? .spaceBetween : .start,
        children: [
          RadioGroup<bool>(
            groupValue: true,
            onChanged: (_) {},
            child: Radio<bool>(
              value: isSelected,
              activeColor: theme?.colorScheme.primary,
              fillColor: WidgetStatePropertyAll(theme?.colorScheme.primary),
            ),
          ),
          _message(theme, isMe),
        ],
      );
    }

    return Row(
      mainAxisAlignment: isMe ? .end : .start,
      children: [
        _message(theme, isMe),
      ],
    );
  }

  Widget _message(UiKitThemeData? theme, bool isMe) {
    final showUser = isMe ? false : (isGroup && isFirstInGroup);

    if (isMe) return _messageBubble(theme);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isMe ? .end : .start,
      children: [
        if (showUser)
          AvatarWidget(size: 35.w).paddingOnly(right: SpacingFoundation.horizontalSpacing8)
        else if (isGroup)
          SizedBox(width: 35.w + SpacingFoundation.horizontalSpacing10),
        _messageBubble(theme, isMe: false),
      ],
    );
  }

  Widget _messageBubble(UiKitThemeData? theme, {bool isMe = true}) {
    final correctColor = (isMe ? theme?.colorScheme.primary : theme?.colorScheme.surface2) ?? Colors.green;
    final contentColor = isMe ? theme?.colorScheme.inversePrimary : ColorsFoundation.anotherMessageColor;

    Widget buildContent(MessageReadStatus? readStatus) => MessageRenderObject(
      text: message.content,
      sentAt: message.createAt.toChatTime(),
      style: theme?.circularStdTextTheme.bookSmall.copyWith(
        color: contentColor,
      ),
      sentAtStyle: theme?.circularStdTextTheme.bookSmall10.copyWith(
        color: isMe ? theme.colorScheme.inversePrimary : theme.colorScheme.mutedColor,
      ),
      isEditing: message.isEditing,
      readStatus: readStatus,
      readTickColor: theme?.colorScheme.uiPrimary3,
    );

    final readCursor = this.readCursor;
    final resolveReadStatus = this.resolveReadStatus;

    final messagePainter = CustomPaint(
      size: Size(SpacingFoundation.messageBubbleMaxWidth, double.infinity),
      painter: _MessageBubblePainter(
        isMe: isMe,
        color: correctColor,
        radius: _bubbleRadius,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: SpacingFoundation.messageBubbleMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SpacingFoundation.horizontalSpacing14,
          vertical: SpacingFoundation.verticalSpacing12,
        ),
        child: isMe && readCursor != null && resolveReadStatus != null
            ? ValueListenableBuilder<List<ChatMemberModel>>(
                valueListenable: readCursor,
                builder: (_, __, ___) => buildContent(resolveReadStatus(message)),
              )
            : buildContent(null),
      ),
    );

    final reply = this.reply;
    if (reply == null) return messagePainter;

    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ReplyPreviewBox(preview: reply, isMe: isMe, contentColor: contentColor),
        messagePainter,
      ],
    );
  }
}

class _ReplyPreviewBox extends StatelessWidget {
  const _ReplyPreviewBox({required this.preview, required this.isMe, this.contentColor});

  final ReplyPreview preview;
  final bool isMe;
  final Color? contentColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final scheme = theme?.colorScheme;
    final textStyle = theme?.circularStdTextTheme.bookSmall.copyWith(color: contentColor);

    final content = switch (preview.reply) {
      AvailableReplyTo(:final content, :final contentType) => [
        Text(
          S.of(context).ReplyTo(preview.authorName ?? ''),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme?.circularStdTextTheme.bookSmall.copyWith(
            color: isMe ? scheme?.primary : scheme?.replyAccentColor,
          ),
        ),
        Text(
          contentType == ContentType.text ? content : S.of(context).Attachment,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      ],
      DeletedReplyTo() => [
        Text(S.of(context).MessageDeleted, style: textStyle?.copyWith(fontStyle: FontStyle.italic)),
      ],
    };

    return Container(
      constraints: BoxConstraints(maxWidth: SpacingFoundation.messageBubbleMaxWidth),
      decoration: BoxDecoration(
        color: isMe ? scheme?.replyOwnColor : scheme?.replyColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(_bubbleRadius),
          topRight: const Radius.circular(_bubbleRadius),
          bottomLeft: isMe ? const Radius.circular(_bubbleRadius) : Radius.zero,
          bottomRight: isMe ? Radius.zero : const Radius.circular(_bubbleRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: content,
      ).paddingAll(EdgeInsetsFoundation.all8),
    );
  }
}

class _MessageBubblePainter extends CustomPainter {
  _MessageBubblePainter({
    required this.isMe,
    required this.color,
    required this.radius,
  });

  final bool isMe;
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final r = radius;
    final path = Path();

    if (isMe) {
      path.moveTo(rect.left, rect.top);
      path.lineTo(rect.right, rect.top);
      path.lineTo(rect.right, rect.bottom - r);
      path.quadraticBezierTo(rect.right, rect.bottom, rect.right - r, rect.bottom);
      path.lineTo(rect.left + r, rect.bottom);
      path.quadraticBezierTo(rect.left, rect.bottom, rect.left, rect.bottom - r);
      path.lineTo(rect.left, rect.top + r);
      path.quadraticBezierTo(rect.left, rect.top, rect.left + r, rect.top);
    } else {
      path.moveTo(rect.left, rect.bottom);
      path.lineTo(rect.left, rect.top + r);
      path.quadraticBezierTo(rect.left, rect.top, rect.left + r, rect.top);
      path.lineTo(rect.right - r, rect.top);
      path.quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + r);
      path.lineTo(rect.right, rect.bottom - r);
      path.quadraticBezierTo(rect.right, rect.bottom, rect.right - r, rect.bottom);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _MessageBubblePainter oldDelegate) {
    return oldDelegate.isMe != isMe || oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
