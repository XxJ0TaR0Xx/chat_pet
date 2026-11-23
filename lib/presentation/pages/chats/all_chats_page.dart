import 'dart:async';

import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/widget/chat_row_item.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/ui_kit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({super.key});

  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  bool _isCreatingChat = false;

  Future<void> _createChat() async {
    if (_isCreatingChat || !(ModalRoute.of(context)?.isCurrent ?? true)) return;

    final cubit = context.read<ChatCubit>();
    setState(() => _isCreatingChat = true);
    try {
      final selectedUserId = await GoRouter.of(context).push<String>(AppRoutes.selectContact);
      if (!mounted || selectedUserId == null || cubit.isClosed) return;

      final chat = await cubit.createChat(selectedUserId);
      if (!mounted || chat == null) return;

      final interlocutor = chat.members.where((member) => member.id == selectedUserId).firstOrNull;
      if (interlocutor == null) {
        CustomSnackBar(context, text: S.of(context).CouldntCreateChat).showErrorMessage();
        return;
      }

      unawaited(
        GoRouter.of(context).push(
          AppRoutes.chatId.replaceFirst(':id', chat.id),
          extra: interlocutor,
        ),
      );
    } finally {
      if (mounted) setState(() => _isCreatingChat = false);
    }
  }

  Future<bool> onDeleteChat(BuildContext context, String chatId) async {
    bool isDeleted = false;

    await UiKitDialog(
      title: S.of(context).AreYouSureDeleteTheChat,
      buttons: [
        ButtonDialogContent.regular(
          title: S.of(context).Cancel,
          onTap: () {
            GoRouterHelper(context).pop();
            isDeleted = false;
          },
        ),
        ButtonDialogContent.primary(
          title: S.of(context).Delete,
          onTap: () async {
            GoRouterHelper(context).pop();
            isDeleted = await _deleteChat(context, chatId);
          },
        ),
      ],
    ).show(context);

    return isDeleted;
  }

  Future<bool> _deleteChat(BuildContext context, String chatId) async {
    final result = await context.read<ChatCubit>().deleteChat(chatId);

    if (!mounted) return false;

    return result.fold(
      (failure) {
        CustomSnackBar(
          context,
          text: S.of(context).ErrorMsg(failure.message),
        ).showErrorMessage();

        return false;
      },
      (_) => true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        switch (state) {
          case ChatStateError(:final error):
            CustomSnackBar(context, text: error).showErrorMessage();

          case ChatStateInitial _:
          case ChatStateLoaded _:
          case ChatStateLoading _:
          default:
        }
      },
      child: Scaffold(
        backgroundColor: context.uiKitTheme?.colorScheme.darkNeutral ?? ColorsFoundation.darkNeutral,
        floatingActionButton: FloatingActionButton(
          onPressed: _isCreatingChat ? null : _createChat,
          tooltip: S.of(context).FindFriends,
          backgroundColor: ColorsFoundation.primary2,
          foregroundColor: ColorsFoundation.surfaceBase,
          child: const Icon(Icons.add_comment_outlined),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
              cubit.getChats,
            );
          },
          child: CustomScrollView(
            slivers: [
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) => SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: UiKitHomeAppBar(
                    action: AvatarWidget(
                      size: 40.w,
                      url: state.user?.avatarUrl,
                    ),
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace30.sliver,
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  final List<ChatModel>? chats = state is ChatStateLoaded ? state.models : null;
                  final isEmpty = switch (state) {
                    ChatStateLoaded(:final models) => models.isEmpty,
                    _ => false,
                  };

                  if (isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: BottomSheetWidget(
                        children: [
                          Expanded(
                            child: EmptyStateWidget(
                              icon: Icons.chat_bubble_outline_rounded,
                              title: S.of(context).NoChatsYet,
                              subtitle: S.of(context).NoChatsYetDescription,
                              actionText: S.of(context).FindFriends,
                              onActionTap: _isCreatingChat ? null : _createChat,
                            ),
                          ),
                          SizedBox(height: SpacingFoundation.verticalSpacing40 * 2),
                        ],
                      ),
                    );
                  }

                  return SliverMainAxisGroup(
                    slivers: [
                      BottomSheetWidget(
                        children: [
                          Skeletonizer(
                            enabled: state is ChatStateLoading || state is ChatStateError,
                            effect: const PulseEffect(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: chats != null ? chats.length : 12,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final ChatModel? chatModel = chats != null ? chats[index] : null;

                                if (chatModel == null) return const SizedBox.shrink();

                                return ChatRowItem(
                                  name: chatModel.displayName ?? 'None',
                                  secondName: chatModel.name,
                                  date: chatModel.lastMessage?.createAt,
                                  lastMessage: chatModel.lastMessage?.content ?? '',
                                  uncheckMessage: chatModel.unreadCount,
                                  avatarUrl: chatModel.avatarUrl,
                                  padding: EdgeInsets.only(
                                    left: SpacingFoundation.horizontalSpacing24,
                                    right: SpacingFoundation.horizontalSpacing24,
                                    bottom: SpacingFoundation.verticalSpacing12,
                                    top: SpacingFoundation.verticalSpacing12,
                                  ),
                                  onTap: () {
                                    if (!(ModalRoute.of(context)?.isCurrent ?? true)) return;

                                    context.read<ChatCubit>().clearUncheckedMessageCount(chatModel.id);
                                    unawaited(
                                      GoRouter.of(context).push(
                                        AppRoutes.chatId.replaceFirst(':id', chatModel.id),
                                        extra: chatModel.members.firstWhere(
                                          (e) => e.id != context.read<UserCubit>().state.user?.id,
                                        ),
                                      ),
                                    );
                                  },
                                  onDelete: () => onDeleteChat(context, chatModel.id),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: SpacingFoundation.verticalSpacing40 * 2),
                        ],
                      ).sliver,
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: ColoredBox(
                          color: context.uiKitTheme?.colorScheme.surfaceBase ?? Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
