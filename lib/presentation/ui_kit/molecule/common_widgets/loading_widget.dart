import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.h,
        width: 24.h,
        child: CircularProgressIndicator(
          color: context.uiKitTheme?.colorScheme.inverseSurface,
        ),
      ),
    );
  }
}
