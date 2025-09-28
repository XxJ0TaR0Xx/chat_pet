import 'package:chat_pet/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:flutter/material.dart';

extension UiKitThemeExtention on BuildContext {
  UiKitThemeData? get uiKitTheme => Theme.of(this).extension<UiKitThemeData>();
}
