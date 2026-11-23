import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ChatRowItem extends StatelessWidget {
  const ChatRowItem({
    required this.name,
    required this.uncheckMessage,
    this.date,
    this.lastMessage,
    this.secondName,
    this.avatarUrl,
    this.padding,
    this.onTap,
    this.onDelete,
    super.key,
  });

  final String name;
  final int uncheckMessage;
  final DateTime? date;
  final String? lastMessage;
  final String? secondName;
  final String? avatarUrl;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Future<bool?> Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final circularStyle = theme?.circularStdTextTheme.book.copyWith(
      fontSize: 12.w,
      color: ColorsFoundation.backNeutral1,
    );

    return Dismissible(
      key: Key(name),
      dismissThresholds: const {
        DismissDirection.horizontal: 0.4,
      },
      confirmDismiss: (_) async {
        final callback = onDelete;
        if (callback == null) return false;

        return callback();
      },
      child: Material(
        color: theme?.colorScheme.surfaceBase ?? ColorsFoundation.surfaceBase,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarWidget(url: avatarUrl),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name ${secondName ?? ''}',
                        style: theme?.carosTextTheme.bold.copyWith(fontSize: 20.w),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (lastMessage != null && lastMessage!.isNotEmpty) ...[
                        SpacingFoundation.verticalSpace6,
                        Flexible(
                          child: Text(
                            lastMessage!,
                            style: circularStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
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
                      if (date != null)
                        Text(
                          date!.timeAgo(),
                          style: circularStyle,
                        ).paddingOnly(bottom: SpacingFoundation.verticalSpacing8),
                      if (uncheckMessage > 0)
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsFoundation.red,
                          ),
                          child: Center(
                            child: Text(
                              uncheckMessage.toString(),
                              style: circularStyle?.copyWith(color: ColorsFoundation.surfaceBase),
                            ).paddingAll(EdgeInsetsFoundation.all8),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
