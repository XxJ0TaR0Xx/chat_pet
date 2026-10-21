import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/ui_kit/extension/theme_extension.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:flutter/material.dart';

Future<void> exitDialog(
  BuildContext context, {
  VoidCallback? onNoTap,
  VoidCallback? onYesTap,
}) async {
  final theme = context.uiKitTheme;

  await UiKitDialog(
    title: S.of(context).AreYouSureYouWantToGetOut,
    buttons: [
      ButtonDialogContent.regular(
        title: S.of(context).No,
        onTap: onNoTap ?? () {},
      ),
      ButtonDialogContent.primary(
        title: S.of(context).Yes,
        onTap: onYesTap ?? () {},
      ),
    ],
    content: [
      Flexible(
        child: Text(
          S.of(context).AfterYouLogOut,
          style: theme?.carosTextTheme.medium,
        ),
      ),
    ],
  ).show(context);
}
