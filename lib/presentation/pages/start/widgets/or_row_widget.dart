import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class OrRowWidget extends StatelessWidget {
  const OrRowWidget({
    super.key,
    this.textColor = ColorsFoundation.textColor,
  });
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: SpacingFoundation.horizontalSpacing16,
      children: [
        Expanded(
          child: Divider(
            color: ColorsFoundation.backNeutral3,
            thickness: 0.5.w,
          ),
        ),
        Text(
          S.of(context).Or.toUpperCase(),
          style: context.uiKitTheme?.circularStdTextTheme.book.copyWith(
            fontSize: 14.w,
            color: textColor,
          ),
        ),
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
