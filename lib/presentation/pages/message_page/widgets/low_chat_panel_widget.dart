import 'package:chat_pet/presentation/pages/message_page/controllers/message_composer_controller.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme_data.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

const _bannerAnimationDuration = Duration(milliseconds: 200);

class LowChatPanelWidget extends StatefulWidget {
  const LowChatPanelWidget({
    required this.composer,
    this.onSendMessageTap,
    this.onDocumentsTap,
    this.onCameraTap,
    super.key,
  });

  final MessageComposerController composer;
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
    widget.composer.addListener(_onModeChanged);
  }

  @override
  void didUpdateWidget(covariant LowChatPanelWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.composer != widget.composer) {
      oldWidget.composer.removeListener(_onModeChanged);
      widget.composer.addListener(_onModeChanged);
    }
  }

  @override
  void dispose() {
    widget.composer.removeListener(_onModeChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onModeChanged() {
    if (widget.composer.value is ComposerModeIdle) return;

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
        border: Border(top: BorderSide(color: ColorsFoundation.mutedBorderColor)),
      ),
      child: ValueListenableBuilder<ComposerMode>(
        valueListenable: widget.composer,
        builder: (_, mode, textField) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
              duration: _bannerAnimationDuration,
              curve: Curves.easeOutCubic,
              alignment: Alignment.bottomCenter,
              child: switch (mode) {
                final ComposerTarget targeted => _ComposerBanner(mode: targeted, onCloseTap: widget.composer.cancel),
                ComposerModeIdle() => const SizedBox(width: double.infinity),
              },
            ),
            textField!,
          ],
        ),
        child: _textFiled(theme),
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
              controller: widget.composer.controller,
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

class _ComposerBanner extends StatelessWidget {
  const _ComposerBanner({required this.mode, required this.onCloseTap});

  final ComposerTarget mode;
  final VoidCallback onCloseTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    final (icon, title) = switch (mode) {
      ComposerEditing() => (AppIcons.edit, S.of(context).EditingMessage),
      ComposerReply(:final authorName) => (AppIcons.reply, S.of(context).ReplyTo(authorName)),
    };

    return DecoratedBox(
      decoration: BoxDecoration(color: theme?.colorScheme.uiPrimary.withValues(alpha: 0.25)),
      child:
          Row(
            children: [
              ChatPetIcon.icon(icon, color: theme?.colorScheme.primary),
              SpacingFoundation.horizontalSpace10,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme?.carosTextTheme.mediumBold12.copyWith(color: theme.colorScheme.primary),
                    ),
                    Text(
                      mode.message.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme?.circularStdTextTheme.bookSmall.copyWith(color: theme.colorScheme.mutedColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onCloseTap,
                child: ChatPetIcon.icon(AppIcons.x, color: theme?.colorScheme.mutedColor, size: 14.w),
              ),
            ],
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing20,
            vertical: SpacingFoundation.verticalSpacing12,
          ),
    );
  }
}
