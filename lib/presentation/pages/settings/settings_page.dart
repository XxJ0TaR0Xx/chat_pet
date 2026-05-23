import 'dart:async';

import 'package:chat_pet/presentation/pages/profile/profile_page.dart';
import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/pages/start/start_page.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/exit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = context.read<SettingCubit>();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  Future<void> _onSettingsButtonTap(BuildContext context, AppIcons icon) async {
    switch (icon) {
      case AppIcons.keys:
        unawaited(context.push(ProfilePage(settingCubit: cubit)));
      case AppIcons.arrowBack:
        await exitDialog(
          context,
          onNoTap: () => context.pop(),
          onYesTap: () async {
            await cubit.logout(context);
            if (context.mounted) {
              unawaited(context.pushAndRemoveUntil(const StartPage()));
            }
          },
        );
      default:
        CustomSnackBar(context, text: S.of(context).SomethingWentWrong).showDevMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          UiKitAppBar(
            leadingColor: theme?.colorScheme.surfaceBase,
            child: Text(
              S.of(context).Settings,
              style: theme?.carosTextTheme.medium.copyWith(
                fontSize: 20.w,
                color: theme.colorScheme.surfaceBase,
              ),
            ),
          ).sliver,
          SizedBox(height: 52.h).sliver,
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return state.when(
                  initial: SizedBox.shrink,
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
                        text: S.of(context).Repeat,
                        onTap: () => cubit.initialize(),
                      ),
                      Spacer(),
                    ],
                  ),
                  loaded: (userModel) => BottomSheetWidget(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpacingFoundation.verticalSpace24,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.w,
                            backgroundImage: userModel?.avatarUrl != null
                                ? NetworkImage(userModel!.avatarUrl!)
                                : AssetImage('assets/images/orig.png'),
                          ),
                          SpacingFoundation.horizontalSpace24,
                          Column(
                            mainAxisSize: .min,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                '${userModel?.name ?? S.of(context).NotFounded} ${userModel?.lastName ?? ''}',
                                style: theme?.carosTextTheme.bold.copyWith(
                                  fontSize: 20.w,
                                ),
                              ),
                              SpacingFoundation.verticalSpace6,
                              //TODO add from server
                              Text(
                                'Never give up 💪',
                                style: theme?.circularStdTextTheme.book.copyWith(
                                  fontSize: 12.w,
                                  color: ColorsFoundation.backNeutral1,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          ChatPetIcon.icon(
                            AppIcons.qrCode,
                            color: ColorsFoundation.primary,
                            size: 24.w,
                          ),
                        ],
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                      SpacingFoundation.verticalSpace20,
                      Divider(color: ColorsFoundation.backNeutral1),
                      SpacingFoundation.verticalSpace30,
                      ...[
                        SettingsButtonUiModel(
                          title: S.of(context).Account,
                          description: S.of(context).PrivacySecurityChange,
                          icon: .keys,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).Chat,
                          description: S.of(context).ChatHistoryThemeWallpapers,
                          icon: .message,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).Notifications,
                          icon: .notifications,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).Help,
                          description: S.of(context).HelpCenter,
                          icon: .help,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).StorageAndData,
                          description: S.of(context).NetworkUsage,
                          icon: .data,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).InviteAFriend,
                          icon: .users,
                        ),
                        SettingsButtonUiModel(
                          title: S.of(context).LogOutOfYouAccount,
                          icon: .arrowBack,
                        ),
                      ].map(
                        (e) {
                          final isExist = e.icon == AppIcons.arrowBack;
                          final color = isExist ? ColorsFoundation.red : ColorsFoundation.backNeutral1;

                          return GestureDetector(
                            onTap: () async => _onSettingsButtonTap(context, e.icon),
                            child:
                                Row(
                                  children: [
                                    Container(
                                      width: 44.w,
                                      height: 44.w,
                                      decoration: BoxDecoration(
                                        color: color.withValues(alpha: 0.09),
                                        shape: .circle,
                                      ),
                                      child: ChatPetIcon.icon(
                                        e.icon,
                                        color: color,
                                      ).paddingAll(EdgeInsetsFoundation.all8),
                                    ),
                                    SpacingFoundation.horizontalSpace12,
                                    Column(
                                      mainAxisSize: .min,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          e.title,
                                          style: theme?.carosTextTheme.bold.copyWith(
                                            color: isExist ? ColorsFoundation.red : null,
                                          ),
                                        ),
                                        if (e.description != null && e.description!.isNotEmpty) ...[
                                          SpacingFoundation.verticalSpace6,
                                          Text(
                                            e.description!,
                                            style: theme?.circularStdTextTheme.book.copyWith(
                                              color: color,
                                              fontSize: 12.w,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ).paddingOnly(
                                  left: SpacingFoundation.horizontalSpacing24,
                                  right: SpacingFoundation.horizontalSpacing24,
                                  bottom: SpacingFoundation.verticalSpacing30,
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsButtonUiModel {
  SettingsButtonUiModel({
    required this.title,
    required this.icon,
    this.description,
  });

  final String title;
  final String? description;
  final AppIcons icon;
}
