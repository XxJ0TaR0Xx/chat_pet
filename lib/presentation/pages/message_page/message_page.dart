import 'package:chat_pet/presentation/pages/message_page/cubit/message_cubit.dart';
import 'package:chat_pet/presentation/pages/message_page/models/message_model.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/low_chat_panel_widget.dart';
import 'package:chat_pet/presentation/pages/message_page/widgets/message_bubble.dart';
import 'package:chat_pet/presentation/ui_kit/extension/time_extension.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({required this.id, super.key});
  final String id;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _controller = TextEditingController();
  late final MessageCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = MessageCubit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme?.colorScheme.surfaceBase,

        body: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<MessageCubit, MessageState>(
            builder: (context, state) {
              return state.when(
                loading: LoadingWidget.new,
                initial: LoadingWidget.new,
                error: (errorMessage) => Center(
                  //TODO style and refreshButton
                  child: Text('Произошла ошибка: $errorMessage'),
                ),
                loaded: (messages, lastModel, userModel) => Column(
                  children: [
                    MessageAppBarWidget(preferredSize: const Size(double.infinity, 80)),
                    SpacingFoundation.verticalSpace20,
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        padding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing24),
                        itemBuilder: (context, index) {
                          final model = messages[index];
                          final prevModel = (index + 1 < messages.length) ? messages[index + 1] : null;

                          final padding = lastModel?.messageType == model.messageType
                              ? SpacingFoundation.verticalSpacing10
                              : SpacingFoundation.verticalSpacing20;
                          late bool showTime;

                          bool isFirstInGroup = false;
                          if (model.messageType == MessageType.another || model.messageType == MessageType.audioAnother) {
                            if (prevModel == null ||
                                (prevModel.messageType != MessageType.another && prevModel.messageType != MessageType.audioAnother)) {
                              isFirstInGroup = true;
                            }
                          }

                          if (lastModel != null && model.sendDate.isSameMinute(lastModel!.sendDate) && lastModel!.messageType == model.messageType) {
                            showTime = false;
                          } else {
                            lastModel = model;
                            showTime = true;
                          }

                          return switch (model.messageType) {
                            MessageType.date => Row(
                              mainAxisAlignment: .center,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color(0xFFF2F7FB),
                                  ),
                                  child: Text(
                                    model.sendDate.isToday ? 'Today' : 'asdasd',
                                    style: theme?.carosTextTheme.mediumBold12,
                                  ).paddingAll(EdgeInsetsFoundation.all6),
                                ),
                              ],
                            ).paddingOnly(bottom: padding),
                            MessageType.me => MessageBubble(
                              message: model,
                              showTime: showTime,
                            ).paddingOnly(bottom: padding),
                            MessageType.another => MessageBubble(
                              message: model,
                              showTime: showTime,
                              isFirstInGroup: isFirstInGroup,
                              isMe: false,
                            ).paddingOnly(bottom: padding),
                            MessageType.audioMe => SizedBox.shrink().paddingOnly(bottom: padding),
                            MessageType.audioAnother => SizedBox.shrink().paddingOnly(bottom: padding),
                          };
                        },
                      ),
                    ),
                    LowChatPanelWidget(
                      controller: _controller,
                      onSendMessageTap: () {
                        final data = _controller.text.trim();
                        if (data.isNotEmpty) {
                          cubit.sendMessage(
                            MessageModel(
                              messageType: MessageType.me,
                              sendDate: DateTime.now(),
                              data: data,
                            ),
                          );
                          _controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
