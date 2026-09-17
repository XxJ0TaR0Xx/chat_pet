import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class LowChatPanelWidget extends StatefulWidget {
  const LowChatPanelWidget({
    required this.controller,
    required this.editingMessage,
    this.onSendMessageTap,
    this.onDocumentsTap,
    this.onCameraTap,
    super.key,
  });

  final TextEditingController controller;
  final ValueNotifier<MessageModel?> editingMessage;
  final VoidCallback? onSendMessageTap;
  final VoidCallback? onDocumentsTap;
  final VoidCallback? onCameraTap;

  @override
  State<LowChatPanelWidget> createState() => _LowChatPanelWidgetState();
}

class _LowChatPanelWidgetState extends State<LowChatPanelWidget> {
  final groupId = 'TapRegion';
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.editingMessage.addListener(_onEditingMessageChanged);
  }

  @override
  void didUpdateWidget(covariant LowChatPanelWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.editingMessage != widget.editingMessage) {
      oldWidget.editingMessage.removeListener(_onEditingMessageChanged);
      widget.editingMessage.addListener(_onEditingMessageChanged);
    }
  }

  @override
  void dispose() {
    widget.editingMessage.removeListener(_onEditingMessageChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onEditingMessageChanged() {
    final editingMessage = widget.editingMessage.value;
    if (editingMessage == null) return;

    widget.controller
      ..text = editingMessage.content
      ..selection = TextSelection.collapsed(offset: editingMessage.content.length);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Container(
      width: 1.sw,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorsFoundation.mutedBorderColor),
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: widget.editingMessage,
        builder: (_, editingMessage, __) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (editingMessage != null) _editingBanner(theme, editingMessage),
            _textFiled(theme),
          ],
        ),
      ),
    );
  }

  Widget _editingBanner(UiKitThemeData? theme, MessageModel editingMessage) {
    return DecoratedBox(
      decoration: BoxDecoration(color: theme?.colorScheme.uiPrimary.withValues(alpha: 0.25)),
      child:
          Row(
            children: [
              ChatPetIcon.icon(
                AppIcons.edit,
                color: theme?.colorScheme.primary,
              ),
              SpacingFoundation.horizontalSpace10,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).EditingMessage,
                    style: theme?.carosTextTheme.mediumBold12.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    editingMessage.content,
                    style: theme?.circularStdTextTheme.bookSmall.copyWith(
                      color: theme.colorScheme.mutedColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  widget.editingMessage.value = null;
                  widget.controller.text = '';
                },
                child: ChatPetIcon.icon(
                  AppIcons.x,
                  color: theme?.colorScheme.mutedColor,
                  size: 14.w,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing20,
            vertical: SpacingFoundation.verticalSpacing12,
          ),
    );
  }

  Widget _textFiled(UiKitThemeData? theme) {
    return Row(
      children: [
        ChatPetIcon.icon(
          AppIcons.path,
          onTap: widget.onDocumentsTap,
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: TapRegion(
            groupId: groupId,
            onTapOutside: (_) {
              _focusNode.unfocus();
            },
            child: TextField(
              focusNode: _focusNode,
              cursorColor: theme?.colorScheme.primary,
              controller: widget.controller,
              style: theme?.circularStdTextTheme.bookSmallW600,
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
                focusColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
                hoverColor: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.1),
                hintText: S.of(context).WriteYourMessage,
                hintStyle: theme?.circularStdTextTheme.bookSmallW600.copyWith(
                  color: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: theme?.colorScheme.error ?? ColorsFoundation.error),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 24.0 + SpacingFoundation.horizontalSpacing12,
                  maxWidth: 24.0 + SpacingFoundation.horizontalSpacing12,
                ),
                suffixIcon: ChatPetIcon.icon(
                  AppIcons.files,
                  color: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.5),
                ).paddingOnly(right: SpacingFoundation.horizontalSpacing12),
              ),
            ),
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        if (!_focusNode.hasFocus) ...[
          ChatPetIcon.icon(
            AppIcons.camera,
            onTap: widget.onCameraTap,
          ),
          SpacingFoundation.horizontalSpace16,
          ChatPetIcon.icon(AppIcons.microphone),
        ] else
          TapRegion(
            groupId: groupId,
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme?.colorScheme.primary,
              ),
              child:
                  ChatPetIcon.icon(
                    AppIcons.tg,
                    color: theme?.colorScheme.surfaceBase,
                    onTap: widget.onSendMessageTap,
                  ).paddingOnly(
                    left: SpacingFoundation.horizontalSpacing12,
                    right: SpacingFoundation.horizontalSpacing10,
                    bottom: SpacingFoundation.verticalSpacing10,
                    top: SpacingFoundation.verticalSpacing10,
                  ),
            ),
          ),
      ],
    ).paddingSymmetric(
      horizontal: SpacingFoundation.horizontalSpacing24,
      vertical: SpacingFoundation.verticalSpacing20,
    );
  }
}
