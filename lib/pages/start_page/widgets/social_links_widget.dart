import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLinksWidget extends StatelessWidget {
  const SocialLinksWidget({
    super.key,
    this.borderColor = ColorsFoundation.grayColor,
    this.onSocialLinkTap,
    this.isWhiteBackground = true,
  });

  final Color borderColor;
  final ValueChanged<String>? onSocialLinkTap;
  final bool isWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.svg.facebookLogo.path,
        Assets.images.svg.googleLogo.path,
        Assets.images.svg.appleLogo.path
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
              child: SvgPicture.asset(
                e,
                width: 42.w,
                height: 42.w,
                colorFilter: e == Assets.images.svg.appleLogo.path && isWhiteBackground
                    ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                    : null,
                fit: BoxFit.fill,
              ).paddingAll(EdgeInsetsFoundation.all4),
            ),
          ).paddingOnly(
            right: e != Assets.images.svg.appleLogo.path ? SpacingFoundation.horizontalSpacing20 : 0,
          );
        },
      ).toList(),
    );
  }
}
