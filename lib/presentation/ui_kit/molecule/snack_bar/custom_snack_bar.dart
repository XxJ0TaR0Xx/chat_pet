import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

//доделать логин, сделать сохранения токена так ка мы не разлогинились как бы да
class CustomSnackBar {
  const CustomSnackBar(
    this.context, {
    required this.text,
  });

  final BuildContext context;
  final String text;

  void showMessage() {
    //TODO implement
  }

  void showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      _getSnackBar(context.uiKitTheme?.colorScheme.error),
    );
  }

  void showDevMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      _getSnackBar(context.uiKitTheme?.colorScheme.uiPrimary4),
    );
  }

  SnackBar _getSnackBar(Color? color) => SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    backgroundColor: color,
    margin: EdgeInsets.all(EdgeInsetsFoundation.all16),
    padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
    content: Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      ],
    ),
  );
}
