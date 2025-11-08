import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter, MaxLengthEnforcement;

class UiKitTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? label;
  final bool enabled;
  final bool obscureText;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String? p1)? validator;

  final Widget? suffixIcon;

  const UiKitTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.label,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.suffixIcon,
  });

  @override
  State<UiKitTextField> createState() => _UiKitTextFieldState();
}

class _UiKitTextFieldState extends State<UiKitTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      keyboardType: widget.keyboardType,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      cursorColor: ColorsFoundation.primary,
      style: theme?.carosTextTheme.medium,
      cursorErrorColor: ColorsFoundation.error,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.label,
        suffixIcon: widget.suffixIcon,
        labelStyle: theme?.circularStdTextTheme.medium.copyWith(
          color: ColorsFoundation.primary,
          fontSize: 16.w,
        ),
        floatingLabelStyle: theme?.circularStdTextTheme.medium.copyWith(
          color: ColorsFoundation.primary,
          fontSize: 16.w,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.backNeutral3),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.backNeutral3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.backNeutral3),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.error),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.primary),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsFoundation.error),
        ),
      ),
    );
  }
}
