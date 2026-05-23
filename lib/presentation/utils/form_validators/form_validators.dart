abstract class FormValidators {
  static String? requiredValue(String? text) {
    if (text == null || text.trim().isEmpty) return 'Поле обязательно';
    return null;
  }

  static String? phoneValidate(String? text) {
    if (text == null || text.trim().isEmpty) return 'Поле обязательно';
    final regExp = RegExp(r'^\+7-\d{3}-\d{3}-\d{2}-\d{2}$');

    if (!regExp.hasMatch(text)) return 'Номер не валиден';
    return null;
  }
}
