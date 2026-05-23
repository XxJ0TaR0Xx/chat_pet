import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/ui_kit/extension/theme_extension.dart';
import 'package:chat_pet/presentation/ui_kit/foundation/spacing_foundation.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/ui_kit_button.dart';
import 'package:flutter/material.dart';

Future<void> exitDialog(
  BuildContext context, {
  VoidCallback? onNoTap,
  VoidCallback? onYesTap,
}) async {
  final theme = context.uiKitTheme;

  await UiKitDialog(
    title: S.of(context).AreYouSureYouWantToGetOut,
    content: [
      Flexible(
        child: Text(
          S.of(context).AfterYouLogOut,
          style: theme?.carosTextTheme.medium,
        ),
      ),
      Row(
        spacing: SpacingFoundation.horizontalSpacing12,
        children: [
          Expanded(
            child: UiKitButton(text: S.of(context).No, onTap: onNoTap),
          ),
          Expanded(
            child: UiKitButton.primary(text: S.of(context).Yes, onTap: onYesTap),
          ),
        ],
      ),
    ],
  ).show(context);
}
