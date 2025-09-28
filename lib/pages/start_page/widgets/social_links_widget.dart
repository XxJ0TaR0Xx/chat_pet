import 'package:chat_pet/ui_kit/ui_kit.dart';
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
      children: [
        AppIcons.facebook,
        AppIcons.google,
        AppIcons.apple,
      ].map(
        (e) {
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
                size: 42.w,
                isWhiteBackground: isWhiteBackground,
              ).paddingAll(EdgeInsetsFoundation.all4),
            ),
          ).paddingOnly(
            right: e != AppIcons.apple ? SpacingFoundation.horizontalSpacing20 : 0,
          );
        },
      ).toList(),
    );
  }
}
