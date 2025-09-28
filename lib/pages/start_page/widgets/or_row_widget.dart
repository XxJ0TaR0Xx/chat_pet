import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class OrRowWidget extends StatelessWidget {
  final Color textColor;

  const OrRowWidget({
    super.key,
    this.textColor = ColorsFoundation.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: ColorsFoundation.backNeutral3,
            thickness: 0.5.w,
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Text(
          S.of(context).Or.toUpperCase(),
          style: context.uiKitTheme?.circularStdTextTheme.book.copyWith(
            fontSize: 14.w,
            color: textColor,
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Divider(
            color: ColorsFoundation.backNeutral3,
            thickness: 0.5.w,
          ),
        ),
      ],
    );
  }
}
