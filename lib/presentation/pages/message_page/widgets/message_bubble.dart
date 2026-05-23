import 'package:chat_pet/presentation/pages/message_page/models/message_model.dart';
import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    this.isMe = true,
    this.color,
    this.radius = 16.0,
    this.padding,
    this.showTime = false,
    this.isFirstInGroup = false,
    super.key,
  });

  final MessageModel message;
  final bool isMe;
  final Color? color;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool showTime;
  final bool isFirstInGroup;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final avatarSize = 40.w + SpacingFoundation.horizontalSpacing12;

    if (isMe) {
      return _messageBubble(theme);
    }

    return Row(
      crossAxisAlignment: .start,
      children: [
        if (isFirstInGroup)
          AvatarWidget(codeForGen: 'message.sendDate.millisecondsSinceEpoch.toString()').paddingOnly(
            right: SpacingFoundation.horizontalSpacing12,
          )
        else
          SizedBox(width: avatarSize),
        Expanded(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              if (isFirstInGroup) ...[
                SpacingFoundation.verticalSpace6,
                Text(
                  'Jhon Abraham',
                  style: theme?.carosTextTheme.mediumBold14,
                ),
                SpacingFoundation.verticalSpace12,
              ],
              _messageBubble(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _messageBubble(UiKitThemeData? theme) {
    final correctColor = color ?? (isMe ? theme?.colorScheme.primary : theme?.colorScheme.surface2) ?? Colors.green;

    return Row(
      mainAxisAlignment: isMe ? .end : .start,
      children: [
        Column(
          crossAxisAlignment: .end,
          children: [
            CustomPaint(
              size: Size(300.w, double.infinity),
              painter: _MessageBubblePainter(
                isMe: isMe,
                color: correctColor,
                radius: radius,
              ),
              child: Container(
                padding:
                    padding ??
                    EdgeInsets.symmetric(
                      horizontal: SpacingFoundation.horizontalSpacing14,
                      vertical: SpacingFoundation.verticalSpacing12,
                    ),
                child: Text(
                  message.data ?? '',
                  style: theme?.circularStdTextTheme.bookSmall.copyWith(
                    color: isMe ? theme.colorScheme.inversePrimary : ColorsFoundation.anotherMessageColor,
                  ),
                ),
              ),
            ),
            if (showTime)
              Text(
                message.sendDate.toChatTime(),
                style: theme?.circularStdTextTheme.bookSmall10.copyWith(
                  color: theme.colorScheme.mutedColor,
                ),
              ).paddingOnly(top: SpacingFoundation.verticalSpacing8),
          ],
        ),
      ],
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
      path.moveTo(rect.left, rect.top);
      path.lineTo(rect.left, rect.bottom - r);
      path.quadraticBezierTo(rect.left, rect.bottom, rect.left + r, rect.bottom);
      path.lineTo(rect.right - r, rect.bottom);
      path.quadraticBezierTo(rect.right, rect.bottom, rect.right, rect.bottom - r);
      path.lineTo(rect.right, rect.top + r);
      path.quadraticBezierTo(rect.right, rect.top, rect.right - r, rect.top);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _MessageBubblePainter oldDelegate) {
    return oldDelegate.isMe != isMe || oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
