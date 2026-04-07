import 'package:avatar_plus/avatar_plus.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    required this.codeForGen,
    this.isOnline = false,
    super.key,
  });

  final String codeForGen;
  final bool isOnline;
  //TODO when add avatarUrl on back
  // final String? url;

  @override
  Widget build(BuildContext context) {
    final color = context.uiKitTheme?.colorScheme.green;

    return SizedBox(
      width: 40.w,
      height: 40.w,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.string(
              AvatarPlusGen.instance.generate(codeForGen),
            ),
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
