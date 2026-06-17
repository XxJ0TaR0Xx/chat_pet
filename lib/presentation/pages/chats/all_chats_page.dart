import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/widget/chat_row_item.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: context.read<ChatCubit>().getCharts,
              ),
              Spacer(),
            ],
          ),

          loaded: (userModel) => RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 1),
                context.read<ChatCubit>().getCharts,
              );
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: UiKitHomeAppBar(
                    action: CircleAvatar(
                      radius: 20.w,
                      backgroundImage: userModel.avatarUrl != null ? NetworkImage(userModel.avatarUrl!) : AssetImage('assets/images/orig.png'),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace30.sliver,
                BottomSheetWidget(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //TODO add chat id
                            GoRouter.of(context).push(AppRoutes.chatId.replaceFirst(':id', '1'));
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
                    Expanded(
                      child: ColoredBox(
                        color: theme?.colorScheme.surfaceBase ?? Colors.white,
                      ),
                    ),
                  ],
                ).sliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
