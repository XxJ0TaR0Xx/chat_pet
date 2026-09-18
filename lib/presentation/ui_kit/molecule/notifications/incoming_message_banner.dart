import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

/// Дизайн самой карточки уведомления. Чистый UI без бизнес-логики —
/// решение "показывать/не показывать/куда вести по тапу" принимает вызывающий код.
class IncomingMessageBanner extends StatelessWidget {
  const IncomingMessageBanner({
    required this.title,
    required this.message,
    required this.onTap,
    this.avatarUrl,
    super.key,
  });

  final String title;
  final String message;
  final String? avatarUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
          decoration: BoxDecoration(
            color: theme?.colorScheme.surfaceBase ?? ColorsFoundation.surfaceBase,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              AvatarWidget(url: avatarUrl, size: 44.w),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme?.carosTextTheme.bold.copyWith(fontSize: 15.w),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpacingFoundation.verticalSpace4,
                    Text(
                      message,
                      style: theme?.carosTextTheme.medium.copyWith(color: ColorsFoundation.mutedText, fontSize: 13.w),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
