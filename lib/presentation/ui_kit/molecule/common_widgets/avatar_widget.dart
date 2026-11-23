import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    this.isOnline = false,
    this.size,
    this.url,
    super.key,
  });

  final bool isOnline;
  final double? size;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final color = theme?.colorScheme.green;
    final imageUrl = url?.trim();
    final hasUrl = imageUrl != null && imageUrl.isNotEmpty;

    return SizedBox(
      width: size ?? 50.w,
      height: size ?? 50.w,
      child: Stack(
        children: [
          CircleAvatar(
            radius: size ?? 50.w,
            backgroundColor: theme?.colorScheme.grayForegroundColor.withValues(alpha: 0.5),
            backgroundImage: const AssetImage('assets/images/orig.png'),
            foregroundImage: hasUrl ? NetworkImage(imageUrl) : null,
            onForegroundImageError: hasUrl ? (_, __) {} : null,
          ),
          if (isOnline)
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child:
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                  ).paddingOnly(
                    bottom: SpacingFoundation.verticalSpacing4,
                    right: SpacingFoundation.horizontalSpacing4,
                  ),
            ),
        ],
      ),
    );
  }
}
