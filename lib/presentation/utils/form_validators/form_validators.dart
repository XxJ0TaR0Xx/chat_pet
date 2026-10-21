import 'package:chat_pet/core/localization/l10n.dart';

abstract class FormValidators {
  static String? requiredValue(String? text) {
    if (text == null || text.trim().isEmpty) return S.current.ThisFieldCannotBeEmpty;
    return null;
  }

  static String? phoneValidate(String? text) {
    if (text == null || text.trim().isEmpty) return S.current.ThisFieldCannotBeEmpty;
    final regExp = RegExp(r'^\+7-\d{3}-\d{3}-\d{2}-\d{2}$');

    if (!regExp.hasMatch(text)) return S.current.InvalidPhoneNumber;
    return null;
  }
}
