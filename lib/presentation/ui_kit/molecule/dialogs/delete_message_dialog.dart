import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/ui_kit/extension/extensions.dart';
import 'package:chat_pet/presentation/ui_kit/foundation/colors_foundation.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:flutter/material.dart';

Future<void> deleteMessageDialog(
  BuildContext context, {
  required VoidCallback onNoTap,
  required ValueChanged<bool> onYesTap,
}) async {
  final theme = context.uiKitTheme;

  final ValueNotifier<bool> forEveryone = ValueNotifier<bool>(false);

  await UiKitDialog(
    title: 'Вы уверены что хотите удалить выбранное сообщение?',
    titleStyle: theme?.circularStdTextTheme.bookW600,
    content: [
      ValueListenableBuilder(
        valueListenable: forEveryone,
        builder: (_, value, __) => CheckboxListTile(
          title: Text(
            'Удалить это сообщение для всех?',
            style: theme?.circularStdTextTheme.medium,
          ),
          contentPadding: EdgeInsets.zero,
          checkColor: theme?.colorScheme.uiPrimary,
          fillColor: WidgetStateColor.resolveWith(
            (states) => (theme?.colorScheme.grayForegroundColor ?? ColorsFoundation.backNeutral1).withValues(alpha: 0.2),
          ),
          value: value,
          onChanged: (_) => forEveryone.value = !value,
        ),
      ),
    ],
    buttons: [
      ButtonDialogContent.regular(
        title: S.of(context).No,
        onTap: () => onNoTap.call(),
      ),
      ButtonDialogContent.primary(
        title: S.of(context).Yes,
        onTap: () => onYesTap.call(forEveryone.value),
      ),
    ],
  ).show(context);

  forEveryone.dispose();
}
