import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SearchTextFiled extends StatefulWidget {
  const SearchTextFiled({
    required this.controller,
    required this.onArrowBack,
    this.onChange,
    this.onClearTap,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback onArrowBack;
  final ValueChanged<String>? onChange;
  final VoidCallback? onClearTap;

  @override
  State<SearchTextFiled> createState() => _SearchStateTextFiled();
}

class _SearchStateTextFiled extends State<SearchTextFiled> {
  final _focusNode = FocusNode();

  static final borderRadius = BorderRadius.circular(18.0);

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return TapRegion(
      onTapOutside: (_) {
        _focusNode.unfocus();
      },
      child: TextField(
        focusNode: _focusNode,
        cursorColor: theme?.colorScheme.primary,
        controller: widget.controller,
        style: theme?.circularStdTextTheme.bookSmallW600,
        onChanged: (value) => widget.onChange?.call(value),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          constraints: BoxConstraints(minHeight: 44.h),
          fillColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
          focusColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
          hoverColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
          hintText: S.of(context).StartYourSearch,
          hintStyle: theme?.circularStdTextTheme.bookSmallW600.copyWith(
            color: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: theme?.colorScheme.error ?? ColorsFoundation.error),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20.w,
            maxWidth: 20.w + SpacingFoundation.horizontalSpacing24,
          ),
          prefixIcon: GestureDetector(
            onTap: widget.onArrowBack,
            child: ChatPetIcon.icon(
              AppIcons.arrowBack,
            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing12),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 10.w,
            maxWidth: 10.w + SpacingFoundation.horizontalSpacing24,
          ),
          suffixIcon: ValueListenableBuilder(
            valueListenable: widget.controller,
            builder: (_, controller, __) => AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: controller.text.trim().isNotEmpty ? 1.0 : 0.0,
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {
                  widget.controller.clear();
                  widget.onClearTap?.call();
                },
                child: ChatPetIcon.icon(
                  AppIcons.x,
                ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
