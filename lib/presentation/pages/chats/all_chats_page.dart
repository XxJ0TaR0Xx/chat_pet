import 'dart:async';

import 'package:chat_pet/domain/models/chat/chat_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/widget/chat_row_item.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({super.key});

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
      child: RefreshIndicator(
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
                  action: CircleAvatar(
                    radius: 20.w,
                    backgroundImage: state.user?.avatarUrl != null
                        ? NetworkImage(state.user!.avatarUrl!)
                        : const AssetImage('assets/images/orig.png'),
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
                            onActionTap: () async {
                              final selectedUserId = await GoRouter.of(context).push<String>(AppRoutes.selectContact);
                              if (selectedUserId == null) return;

                              final chatModel = await cubit.createChat(selectedUserId);

                              if (context.mounted) {
                                if (chatModel != null) {
                                  //TODO think about group chats
                                  unawaited(
                                    GoRouter.of(context).push(AppRoutes.chatId.replaceFirst(':id', chatModel.id), extra: chatModel.members[0]),
                                  );
                                } else {
                                  CustomSnackBar(context, text: S.of(context).CouldntCreateChat).showErrorMessage();
                                }
                              }
                            },
                          ),
                        ),
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

                              return ChatRowItem(
                                name: chatModel?.displayName ?? 'None',
                                secondName: chatModel?.name,
                                date: chatModel?.lastMessage?.createAt ?? DateTime.now(),
                                lastMessage: chatModel?.lastMessage?.content ?? '',
                                uncheckMessage: chatModel?.uncheckedMessageCount ?? 0,
                                avatarUrl: chatModel?.avatarUrl,
                                padding: EdgeInsets.only(
                                  left: SpacingFoundation.horizontalSpacing24,
                                  right: SpacingFoundation.horizontalSpacing24,
                                  bottom: SpacingFoundation.verticalSpacing12,
                                  top: SpacingFoundation.verticalSpacing12,
                                ),
                                onTap: () {
                                  if (chatModel == null) return;
                                  // Двойной тап (или просто быстрый повторный) на строку чата иначе
                                  // пушит MessagePage дважды — оба стека независимо коннектят
                                  // ChatWebSocket к одному и тому же chatId, и каждое сокет-событие
                                  // потом приходит и логируется по два раза. isCurrent становится
                                  // false сразу после первого push — второй тап просто игнорируем.
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
                              );
                            },
                          ),
                        ),
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
    );
  }
}
