import 'package:chat_pet/theme/ui_kit_theme_data.dart';
import 'package:flutter/material.dart';

extension UiKitThemeExtention on BuildContext {
  UiKitThemeData? get theme => Theme.of(this).extension<UiKitThemeData>();
}
