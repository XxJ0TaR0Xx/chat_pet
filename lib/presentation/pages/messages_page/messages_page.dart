import 'package:chat_pet/presentation/pages/messages_page/widget/history_row.dart';
import 'package:chat_pet/presentation/pages/messages_page/widget/message_row_item.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          toolbarHeight: 160.w,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiKitHomeAppBar(),
              SizedBox(height: SpacingFoundation.verticalSpacing30),
              SizedBox(
                height: 72.h,
                child: HistoryRow(),
              ),
            ],
          ),
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
                  return MessageRowItem(
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
                  );
                },
              ),
            ],
          ),
        ).sliver,
      ],
    );
  }
}
