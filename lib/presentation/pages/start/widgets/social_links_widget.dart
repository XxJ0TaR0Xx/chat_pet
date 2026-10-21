import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({
    super.key,
    this.borderColor = ColorsFoundation.grayColor,
    this.onSocialLinkTap,
    this.isWhiteBackground = true,
  });

  final Color borderColor;
  final ValueChanged<AppIcons>? onSocialLinkTap;
  final bool isWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingFoundation.horizontalSpacing20,
      children: [
        AppIcons.facebook,
        AppIcons.google,
        AppIcons.apple,
      ].map(
        (e) {
          final itApple = e == AppIcons.apple;

          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                onSocialLinkTap?.call(e);
              },
              child: ChatPetIcon.socialIcon(
                e,
                size: itApple ? 32.w : 24.w,
                isWhiteBackground: isWhiteBackground,
              ).paddingAll(EdgeInsetsFoundation.all4),
            ).paddingAll(itApple ? EdgeInsetsFoundation.all4 : EdgeInsetsFoundation.all8),
          );
        },
      ).toList(),
    );
  }
}
