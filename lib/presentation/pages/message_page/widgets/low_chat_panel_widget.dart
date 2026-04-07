import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class LowChatPanelWidget extends StatefulWidget {
  const LowChatPanelWidget({
    required this.controller,
    this.onSendMessageTap,
    this.onDocumentsTap,
    this.onCameraTap,
    super.key,
  });

  final TextEditingController controller;
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
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorsFoundation.mutedBorderColor),
        ),
      ),
      child:
          Row(
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
                      hintText: 'Write your message',
                      hintStyle: theme?.circularStdTextTheme.bookSmallW600.copyWith(
                        color: ColorsFoundation.fillMessageTextField.withValues(alpha: 0.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: theme?.colorScheme.error ?? ColorsFoundation.error),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.transparent),
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
          ),
    );
  }
}
