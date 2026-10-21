import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:chat_pet/presentation/utils/form_validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final _maskFormatter = MaskTextInputFormatter(
  mask: '+7-###-###-##-##',
  filter: {'#': RegExp(r'[0-9]')},
);

Future<void> editingDialog(
  BuildContext context, {
  String? initValue,
  ValueChanged<String>? onTap,
  bool isNumber = false,
}) async {
  final TextEditingController controller = TextEditingController(text: initValue);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  await UiKitDialog(
    title: S.of(context).Editing,
    buttons: [
      ButtonDialogContent.regular(
        title: S.of(context).Cancel,
        onTap: () => GoRouter.of(context).pop(),
      ),
      ButtonDialogContent.primary(
        title: S.of(context).Save,
        onTap: () {
          if (formKey.currentState?.validate() ?? false) {
            onTap?.call(controller.text.trim());
          }
        },
      ),
    ],
    content: [
      Row(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: UiKitTextField(
                controller: controller,
                inputFormatters: [if (isNumber) _maskFormatter],
                hintText: S.of(context).EnterNewValue,
                keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
                validator: (text) => isNumber ? FormValidators.phoneValidate(text) : FormValidators.requiredValue(text),
              ),
            ),
          ),
        ],
      ),
    ],
  ).show(context);
}
