import 'dart:developer';

import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/widget/chat_row_item.dart';
import 'package:chat_pet/presentation/pages/message_page/message_page.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({super.key});

  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final theme = context.uiKitTheme;

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.when(
          initial: LoadingWidget.new,
          loading: LoadingWidget.new,
          error: (errorMessage) => Column(
            children: [
              Spacer(),
              Text(
                errorMessage,
                style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
              SpacingFoundation.verticalSpace16,
              UiKitButton.primary(
                text: 'Повторить',
                onTap: cubit.getCharts,
              ),
              Spacer(),
            ],
          ),

          loaded: () => RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration(seconds: 1));
              // cubit.getCharts
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: UiKitHomeAppBar(),
                ),
                SpacingFoundation.verticalSpace30.sliver,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme?.colorScheme.surfaceBase,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SpacingFoundation.verticalSpace14,
                      Container(
                        width: 30.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: theme?.colorScheme.grayForegroundColor,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(32),
                            right: Radius.circular(32),
                          ),
                        ),
                      ),
                      SpacingFoundation.verticalSpace8,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              log('onTap');
                              context.push(MessagePage());
                            },
                            child: ChatRowItem(
                              name: 'Test name',
                              secondName: 'Second name $index',
                              date: DateTime.now(),
                              lastMessage: 'Test last message',
                              uncheckMessage: index,
                              avatarUrl: '',
                              padding: EdgeInsets.only(
                                left: SpacingFoundation.horizontalSpacing24,
                                right: SpacingFoundation.horizontalSpacing24,
                                bottom: SpacingFoundation.verticalSpacing12,
                                top: SpacingFoundation.verticalSpacing12,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ).sliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
