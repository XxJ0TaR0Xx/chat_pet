import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.h,
        width: 24.h,
        child: CircularProgressIndicator(
          color: color ?? context.uiKitTheme?.colorScheme.inverseSurface,
        ),
      ),
    );
  }
}
