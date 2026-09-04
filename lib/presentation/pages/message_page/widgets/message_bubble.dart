import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_render_object.dart';
import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble._({
    required this.message,
    required this.author,
    this.isFirstInGroup = false,
    this.isGroup = false,
    this.isSelectingMode = false,
    this.isSelected = false,
    super.key,
  });

  factory MessageBubble.defaultMode({
    required MessageModel message,
    required UserModel author,
    bool isFirstInGroup = false,
    bool isGroup = false,
    Key? key,
  }) => MessageBubble._(
    message: message,
    author: author,
    isFirstInGroup: isFirstInGroup,
    isGroup: isGroup,
    key: key,
  );

  factory MessageBubble.selectionMode({
    required MessageModel message,
    required UserModel author,
    required bool isSelected,
    bool isFirstInGroup = false,
    bool isGroup = false,
    Key? key,
  }) => MessageBubble._(
    message: message,
    author: author,
    isSelected: isSelected,
    isFirstInGroup: isFirstInGroup,
    isGroup: isGroup,
    isSelectingMode: true,
    key: key,
  );

  final MessageModel message;
  final UserModel author;

  final bool isFirstInGroup;
  final bool isGroup;

  final bool isSelectingMode;
  final bool isSelected;

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

    return CustomPaint(
      size: Size(SpacingFoundation.messageBubbleMaxWidth, double.infinity),
      painter: _MessageBubblePainter(
        isMe: isMe,
        color: correctColor,
        radius: 16.0,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: SpacingFoundation.messageBubbleMaxWidth,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SpacingFoundation.horizontalSpacing14,
          vertical: SpacingFoundation.verticalSpacing12,
        ),
        child: MessageRenderObject(
          text: message.content,
          sentAt: message.createAt.toChatTime(),
          style: theme?.circularStdTextTheme.bookSmall.copyWith(
            color: isMe ? theme.colorScheme.inversePrimary : ColorsFoundation.anotherMessageColor,
          ),
          sentAtStyle: theme?.circularStdTextTheme.bookSmall10.copyWith(
            color: isMe ? theme.colorScheme.inversePrimary : theme.colorScheme.mutedColor,
          ),
          isEditing: message.isEditing,
        ),
      ),
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
