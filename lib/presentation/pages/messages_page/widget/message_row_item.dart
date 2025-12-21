import 'package:avatar_plus/avatar_plus.dart';
import 'package:chat_pet/presentation/pages/messages_page/widget/history_row.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageRowItem extends StatefulWidget {
  const MessageRowItem({
    super.key,
    required this.name,
    this.secondName,
    this.avatarUrl,
    required this.lastMessage,
    required this.date,
    required this.uncheckMessage,
    this.padding,
  });

  final String name;
  final String? secondName;
  final String? avatarUrl;
  final String lastMessage;
  final DateTime date;
  final int uncheckMessage;
  final EdgeInsets? padding;

  @override
  State<MessageRowItem> createState() => _MessageRowItemState();
}

class _MessageRowItemState extends State<MessageRowItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final circularStyle = theme?.circularStdTextTheme.book.copyWith(
      fontSize: 12.w,
      color: ColorsFoundation.backNeutral1,
    );

    return Dismissible(
      key: Key(widget.name),
      dismissThresholds: const {
        DismissDirection.horizontal: 0.4,
      },
      child: Listener(
        onPointerDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onPointerUp: (_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() {
            isPressed = false;
          });
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isPressed ? ColorsFoundation.grey : theme?.colorScheme.surfaceBase,
          ),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.avatarUrl != null)
                  Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.string(
                      AvatarPlusGen.instance.generate("asd"),
                    ),
                  ),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.name} ${widget.secondName}',
                        style: theme?.carosTextTheme.bold.copyWith(fontSize: 20.w),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SpacingFoundation.verticalSpace6,
                      Flexible(
                        child: Text(
                          widget.lastMessage,
                          style: circularStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SpacingFoundation.horizontalSpace16,
                Container(
                  constraints: BoxConstraints(minWidth: 40.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        timeAgo(widget.date),
                        style: circularStyle,
                      ),
                      SpacingFoundation.verticalSpace8,
                      if (widget.uncheckMessage > 0)
                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsFoundation.red,
                          ),
                          child: Center(
                            child: Text(
                              widget.uncheckMessage.toString(),
                              style: circularStyle?.copyWith(color: ColorsFoundation.surfaceBase),
                            ).paddingAll(EdgeInsetsFoundation.all8),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
