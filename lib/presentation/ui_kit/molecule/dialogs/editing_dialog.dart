import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

Future<void> editingDialog(
  BuildContext context, {
  String? initValue,
  ValueChanged<String>? onTap,
}) async {
  final TextEditingController controller = TextEditingController(text: initValue);

  await UiKitDialog(
    title: S.of(context).Editing,
    content: [
      Row(
        children: [
          Expanded(
            child: UiKitTextField(
              controller: controller,
              hintText: S.of(context).EnterNewValue,
            ),
          ),
        ],
      ),
      Row(
        spacing: SpacingFoundation.horizontalSpacing12,
        children: [
          Expanded(
            child: UiKitButton(text: S.of(context).Cancel, onTap: () => context.pop()),
          ),
          Expanded(
            child: UiKitButton.primary(text: S.of(context).Save, onTap: () => onTap?.call(controller.text.trim())),
          ),
        ],
      ),
    ],
  ).show(context);
}
