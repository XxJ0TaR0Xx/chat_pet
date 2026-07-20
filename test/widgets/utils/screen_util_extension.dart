import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

extension ScreenUtilExtension on Widget {
  Widget get screenUtil => ScreenUtilInit(
    designSize: const Size(375, 812),
    child: this,
  );
}
