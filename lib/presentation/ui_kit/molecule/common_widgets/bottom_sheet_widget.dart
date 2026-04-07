import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    super.key,
  });

  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.uiKitTheme?.colorScheme.surfaceBase,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          SpacingFoundation.verticalSpace14,
          Center(
            child: Container(
              width: 30.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: context.uiKitTheme?.colorScheme.grayForegroundColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(32),
                  right: Radius.circular(32),
                ),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
