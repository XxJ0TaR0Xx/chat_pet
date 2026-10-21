import 'dart:ui' as ui show ImageFilter;

import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/pages/message_page/cubit/message_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/models/reply_preview.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_list_item.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/delete_message_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;
import 'package:go_router/go_router.dart';

class ContextMenuMessage {
  const ContextMenuMessage(this.model, this.prevModel, this.anchorRect);

  final MessageModel model;
  final MessageModel? prevModel;

  final Rect anchorRect;
}

class SelectionOverlayWidget extends StatefulWidget {
  const SelectionOverlayWidget({
    required this.contextMenuMessage,
    required this.currentUser,
    required this.interlocutor,
    required this.onDismiss,
    required this.safeAreaPadding,
    required this.authorNameOf,
    this.onEditMessageTap,
    this.onReplyTap,
    this.onSelectTap,
    super.key,
  });

  final ValueListenable<ContextMenuMessage?> contextMenuMessage;
  final UserModel currentUser;
  final UserModel interlocutor;
  final VoidCallback onDismiss;
  final EdgeInsets safeAreaPadding;
  final AuthorNameResolver authorNameOf;
  final ValueChanged<MessageModel>? onEditMessageTap;
  final ValueChanged<MessageModel>? onReplyTap;
  final ValueChanged<MessageModel>? onSelectTap;

  @override
  State<SelectionOverlayWidget> createState() => _SelectionOverlayWidgetState();
}

class _SelectionOverlayWidgetState extends State<SelectionOverlayWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scale;

  String? _lastSelectedId;

  List<_MessageMenuItem> _menuItemsFor(bool isMe) => [
    _MessageMenuItem.regular(
      title: S.of(context).Reply,
      icon: AppIcons.reply,
      onTap: (context, message) {
        widget.onReplyTap?.call(message);
        widget.onDismiss.call();
      },
    ),
    _MessageMenuItem.regular(
      title: S.of(context).Forward,
      icon: AppIcons.send,
      onTap: (context, message) {},
    ),
    if (isMe)
      _MessageMenuItem.regular(
        title: S.of(context).Edit,
        icon: AppIcons.edit,
        onTap: (_, message) {
          widget.onEditMessageTap?.call(message);
          widget.onDismiss.call();
        },
      ),
    _MessageMenuItem.regular(
      title: S.of(context).Copy,
      icon: AppIcons.copy,
      onTap: (_, message) async {
        await Clipboard.setData(ClipboardData(text: message.content));
        widget.onDismiss.call();
      },
    ),
    _MessageMenuItem.regular(
      title: S.of(context).Select,
      icon: AppIcons.iconList,
      onTap: (context, message) {
        widget.onSelectTap?.call(message);
        widget.onDismiss.call();
      },
    ),
    _MessageMenuItem.trash(
      title: S.of(context).Delete,
      onTap: (context, message) async {
        await deleteMessageDialog(
          context,
          onNoTap: () {
            widget.onDismiss.call();
            GoRouter.of(context).pop();
          },
          onYesTap: (value) {
            widget.onDismiss.call();
            context.read<MessageCubit>().deleteMessage(message.id, value);
            GoRouter.of(context).pop();
          },
        );
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack));
    widget.contextMenuMessage.addListener(_handleSelectionChanged);
  }

  void _handleSelectionChanged() {
    final selectedId = widget.contextMenuMessage.value?.model.id;
    if (selectedId != null && selectedId != _lastSelectedId) {
      _scaleController.forward(from: 0);
    }
    _lastSelectedId = selectedId;
  }

  @override
  void dispose() {
    widget.contextMenuMessage.removeListener(_handleSelectionChanged);
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    final width = 1.sw;
    final safeAreaPadding = widget.safeAreaPadding;

    return ValueListenableBuilder<ContextMenuMessage?>(
      valueListenable: widget.contextMenuMessage,
      builder: (context, selected, _) {
        if (selected == null) return const SizedBox.shrink();

        final anchorRect = selected.anchorRect.shift(-Offset(safeAreaPadding.left, safeAreaPadding.top));
        final isMe = selected.model.messageSender == MessageSender.me;
        final menuItems = _menuItemsFor(isMe);

        return Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onDismiss,
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: const SizedBox.expand(),
                ),
              ),
              Positioned.fill(
                child: CustomSingleChildLayout(
                  delegate: _MessageMenuLayoutDelegate(
                    anchorRect: anchorRect,
                    bottomSafeMargin: safeAreaPadding.bottom + SpacingFoundation.verticalSpacing16,
                  ),
                  child: SizedBox(
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: widget.onDismiss,
                          child: ScaleTransition(
                            scale: _scale,
                            child: MessageListItem.menu(
                              model: selected.model,
                              prevModel: selected.prevModel,
                              currentUser: widget.currentUser,
                              interlocutor: widget.interlocutor,
                              authorNameOf: widget.authorNameOf,
                            ),
                          ),
                        ),
                        Container(
                          width: width / 2,
                          decoration: BoxDecoration(
                            color: theme?.colorScheme.grayForegroundColor.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(EdgeInsetsFoundation.all16),
                          ),
                          child:
                              ListView.separated(
                                itemCount: menuItems.length,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => Divider(color: theme?.colorScheme.grayForegroundColor, thickness: 1.w),
                                itemBuilder: (context, index) {
                                  final item = menuItems[index];
                                  final color = item.isDelete ? theme?.colorScheme.error : null;

                                  return InkWell(
                                    onTap: () => item.onTap.call(context, selected.model),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      spacing: SpacingFoundation.horizontalSpacing12,
                                      children: [
                                        ChatPetIcon.icon(item.icon, size: 18.w, color: color),
                                        Text(item.title, style: theme?.circularStdTextTheme.bookSmall.copyWith(color: color)),
                                      ],
                                    ).paddingVertical(SpacingFoundation.horizontalSpacing6),
                                  );
                                },
                              ).paddingSymmetric(
                                horizontal: SpacingFoundation.horizontalSpacing16,
                                vertical: SpacingFoundation.verticalSpacing8,
                              ),
                        ),
                      ],
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MessageMenuItem {
  const _MessageMenuItem._({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDelete = false,
  });

  factory _MessageMenuItem.regular({
    required String title,
    required AppIcons icon,
    required Function(BuildContext, MessageModel) onTap,
  }) => _MessageMenuItem._(
    title: title,
    icon: icon,
    onTap: onTap,
  );

  factory _MessageMenuItem.trash({
    required String title,
    required Function(BuildContext, MessageModel) onTap,
  }) => _MessageMenuItem._(
    title: title,
    icon: AppIcons.trash,
    isDelete: true,
    onTap: onTap,
  );

  final String title;
  final AppIcons icon;
  final bool isDelete;
  final Function(BuildContext, MessageModel) onTap;
}

class _MessageMenuLayoutDelegate extends SingleChildLayoutDelegate {
  _MessageMenuLayoutDelegate({
    required this.anchorRect,
    required this.bottomSafeMargin,
  });

  final Rect anchorRect;
  final double bottomSafeMargin;

  static const _topSafeMargin = 16.0;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) => BoxConstraints.loose(constraints.biggest);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final maxTop = size.height - bottomSafeMargin - childSize.height;
    final top = anchorRect.top.clamp(_topSafeMargin, maxTop < _topSafeMargin ? _topSafeMargin : maxTop);
    final left = anchorRect.left.clamp(0.0, (size.width - childSize.width).clamp(0.0, size.width));

    return Offset(left, top);
  }

  @override
  bool shouldRelayout(covariant _MessageMenuLayoutDelegate oldDelegate) =>
      oldDelegate.anchorRect != anchorRect || oldDelegate.bottomSafeMargin != bottomSafeMargin;
}
