import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/domain/usecases/chats/chat_web_socket_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/delete_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/disconnect_from_chat_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/get_messages_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/send_message_use_case.dart';
import 'package:chat_pet/domain/usecases/chats/update_message_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/controllers/message_selection_controller.dart';
import 'package:chat_pet/presentation/pages/message_page/cubit/message_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/low_chat_panel_widget.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_list_item.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/selection_overlay_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/delete_message_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:chat_pet/presentation/utils/chat_session/open_chat_tracker.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({required this.id, required this.interlocutorModel, super.key});

  final String id;
  final UserModel interlocutorModel;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _controller = TextEditingController();
  late final MessageCubit cubit;
  late final UserModel currentUser;

  final ValueNotifier<ContextMenuMessage?> _contextMenuMessage = ValueNotifier(null);
  final ValueNotifier<MessageModel?> _editingMessage = ValueNotifier(null);
  final _selection = MessageSelectionController();

  @override
  void initState() {
    super.initState();
    currentUser = getIt<UserCubit>().state.user!;
    getIt<OpenChatTracker>().open(widget.id);
    cubit = MessageCubit(
      getIt<GetMessagesUseCase>(),
      getIt<DeleteMessageUseCase>(),
      getIt<DeleteMessagesUseCase>(),
      getIt<UpdateMessageUseCase>(),
      getIt<ChatWebSocketUseCase>(),
      getIt<DisconnectFromChatUseCase>(),
      getIt<SendMessageUseCase>(),
      chatId: widget.id,
      currentUserId: currentUser.id,
    );
  }

  @override
  void dispose() {
    getIt<OpenChatTracker>().close(widget.id);
    cubit.close();
    _controller.dispose();
    _contextMenuMessage.dispose();
    _editingMessage.dispose();
    _selection.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    if (_editingMessage.value != null) {
      cubit.updateMessage(content, _editingMessage.value!.id);
      _editingMessage.value = null;
    } else {
      cubit.sendMessage(content: content);
    }

    _controller.clear();
  }

  void _selectContextMenuMessage(MessageModel model, MessageModel? prevModel, Rect anchorRect) {
    _contextMenuMessage.value = ContextMenuMessage(model, prevModel, anchorRect);
  }

  void _clearSelection() {
    _contextMenuMessage.value = null;
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaPadding = MediaQuery.paddingOf(context);

    return SafeArea(
      child: BlocProvider.value(
        value: cubit,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              backgroundColor: context.uiKitTheme?.colorScheme.surfaceBase,
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
                child: LowChatPanelWidget(
                  controller: _controller,
                  onSendMessageTap: _handleSendMessage,
                  editingMessage: _editingMessage,
                ),
              ),
              body: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _selection,
                    builder: (_, __, ___) {
                      if (_selection.isActive) {
                        return MessageAppBarWidget.selectionMode(
                          userModel: widget.interlocutorModel,
                          selectionCount: _selection.count,
                          onDeleteTap: () {
                            deleteMessageDialog(
                              context,
                              onNoTap: GoRouter.of(context).pop,
                              onYesTap: (isForEveryone) {
                                GoRouter.of(context).pop();
                                cubit.deleteMessages(_selection.value.toList(), isForEveryone);
                                _selection.clear();
                              },
                            );
                          },
                          onForwardTap: () {},
                          onClearTap: _selection.clear,
                        );
                      } else {
                        return MessageAppBarWidget.defaultMode(
                          userModel: widget.interlocutorModel,
                        );
                      }
                    },
                  ),

                  Expanded(
                    child: _MessagesList(
                      currentUser: currentUser,
                      interlocutor: widget.interlocutorModel,
                      contextMenuMessage: _contextMenuMessage,
                      onMessageSelected: _selectContextMenuMessage,
                      selection: _selection,
                    ),
                  ),
                ],
              ),
            ),
            SelectionOverlayWidget(
              contextMenuMessage: _contextMenuMessage,
              currentUser: currentUser,
              interlocutor: widget.interlocutorModel,
              onDismiss: _clearSelection,
              safeAreaPadding: safeAreaPadding,
              onEditMessageTap: (message) {
                _editingMessage.value = message;
              },
              onSelectTap: (message) => _selection.select(message.id),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  const _MessagesList({
    required this.currentUser,
    required this.interlocutor,
    required this.contextMenuMessage,
    required this.onMessageSelected,
    required this.selection,
  });

  final UserModel currentUser;
  final UserModel interlocutor;
  final ValueListenable<ContextMenuMessage?> contextMenuMessage;
  final MessageSelectionController selection;
  final void Function(MessageModel model, MessageModel? prevModel, Rect anchorRect) onMessageSelected;

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;

    final pagingController = context.read<MessageCubit>().pagingController;

    return PagingListener<String, MessageModel>(
      controller: pagingController,
      builder: (context, state, fetchNextPage) {
        final items = state.items ?? const [];

        return PagedListView<String, MessageModel>(
          state: state,
          fetchNextPage: fetchNextPage,
          reverse: true,
          builderDelegate: PagedChildBuilderDelegate<MessageModel>(
            firstPageProgressIndicatorBuilder: (context) => LoadingWidget(color: uiKitTheme?.colorScheme.uiPrimary),
            newPageProgressIndicatorBuilder: (context) =>
                LoadingWidget(color: uiKitTheme?.colorScheme.uiPrimary).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
            firstPageErrorIndicatorBuilder: (context) => Center(
              child: Text(
                S.of(context).ErrorMsg('${state.error}'),
                style: uiKitTheme?.carosTextTheme.bold,
                textAlign: TextAlign.center,
              ),
            ),
            itemBuilder: (context, model, index) {
              final prevModel = index + 1 < items.length ? items[index + 1] : null;

              return ValueListenableBuilder(
                valueListenable: selection,
                builder: (_, __, ___) {
                  if (selection.isActive) {
                    final item = MessageListItem.selectionMode(
                      model: model,
                      prevModel: prevModel,
                      currentUser: currentUser,
                      interlocutor: interlocutor,
                      isSelected: selection.contains(model.id),
                    );

                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () => selection.select(model.id),
                      child: item,
                    );
                  } else {
                    final item = MessageListItem.chat(
                      model: model,
                      prevModel: prevModel,
                      currentUser: currentUser,
                      interlocutor: interlocutor,
                    );

                    return Builder(
                      builder: (itemContext) => GestureDetector(
                        onLongPress: () {
                          final renderBox = itemContext.findRenderObject() as RenderBox?;
                          if (renderBox == null) return;

                          final anchorRect = renderBox.localToGlobal(Offset.zero) & renderBox.size;
                          onMessageSelected(model, prevModel, anchorRect);
                        },
                        child: ValueListenableBuilder<ContextMenuMessage?>(
                          valueListenable: contextMenuMessage,
                          builder: (context, selected, child) => Visibility(
                            maintainSize: true,
                            maintainState: true,
                            maintainAnimation: true,
                            visible: selected?.model.id != model.id,
                            child: child!,
                          ),
                          child: item,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
