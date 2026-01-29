import 'package:chat_pet/presentation/pages/common_widgets/bottom_sheet_widget.dart';
import 'package:chat_pet/presentation/pages/profile_page/profile_page.dart';
import 'package:chat_pet/presentation/pages/settings_page/cubit/setting_cubit.dart';
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
    cubit = SettingCubit();
    super.initState();
  }

  Future<void> updatePhoto() async {
    await cubit.updateUserImage();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: BlocProvider.value(
        value: cubit,
        child: CustomScrollView(
          slivers: [
            UiKitAppBar(
              leadingColor: theme?.colorScheme.surfaceBase,
              // showLeading: false,
              child: Text(
                'Setting',
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
                  if (state is SettingLoading) {
                    return Center(
                      child: SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: CircularProgressIndicator(
                          color: context.uiKitTheme?.colorScheme.inverseSurface,
                        ),
                      ),
                    );
                  }
                  if (state is SettingError) {
                    return Column(
                      children: [
                        Spacer(),
                        Text(
                          state.errorMessage,
                          style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
                        SpacingFoundation.verticalSpace16,
                        UiKitButton.primary(
                          text: 'Повторить',
                          onTap: () {
                            cubit.initialize();
                          },
                        ),
                        Spacer(),
                      ],
                    );
                  }

                  if (state is SettingLoaded) {
                    return BottomSheetWidget(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SpacingFoundation.verticalSpace24,
                        Row(
                          children: [
                            InkWell(
                              onTap: updatePhoto,
                              child: CircleAvatar(
                                radius: 30.w,
                                backgroundImage: AssetImage('assets/images/orig.png'),
                              ),
                            ),
                            SpacingFoundation.horizontalSpace24,
                            Column(
                              mainAxisSize: .min,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  '${state.userModel?.name} ${state.userModel?.lastName}',
                                  style: theme?.carosTextTheme.bold.copyWith(
                                    fontSize: 20.w,
                                  ),
                                ),
                                SpacingFoundation.verticalSpace6,
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
                            title: 'Account',
                            description: 'Privacy, security, change number',
                            icon: .keys,
                          ),
                          SettingsButtonUiModel(
                            title: 'Chat',
                            description: 'Chat history,theme,wallpapers',
                            icon: .message,
                          ),
                          SettingsButtonUiModel(
                            title: 'Notifications',
                            description: 'Notifications',
                            icon: .notifications,
                          ),
                          SettingsButtonUiModel(
                            title: 'Help',
                            description: 'Help center,contact us, privacy policy',
                            icon: .help,
                          ),
                          SettingsButtonUiModel(
                            title: 'Storage and data',
                            description: 'Network usage, stogare usage',
                            icon: .data,
                          ),
                          SettingsButtonUiModel(
                            title: 'Invite a friend',
                            icon: .users,
                          ),
                        ].map(
                          (e) {
                            return GestureDetector(
                              onTap: () {
                                if (e.icon == AppIcons.keys) {
                                  context.push(ProfilePage());
                                }
                              },
                              child:
                                  Row(
                                    children: [
                                      Container(
                                        width: 44.w,
                                        height: 44.w,
                                        decoration: BoxDecoration(
                                          color: ColorsFoundation.backNeutral1.withValues(alpha: 0.09),
                                          shape: .circle,
                                        ),
                                        child: ChatPetIcon.icon(
                                          e.icon,
                                          color: ColorsFoundation.backNeutral1,
                                        ).paddingAll(EdgeInsetsFoundation.all8),
                                      ),
                                      SpacingFoundation.horizontalSpace12,
                                      Column(
                                        mainAxisSize: .min,
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(
                                            e.title,
                                            style: theme?.carosTextTheme.bold,
                                          ),
                                          if (e.description != null && e.description!.isNotEmpty) ...[
                                            SpacingFoundation.verticalSpace6,
                                            Text(
                                              e.description!,
                                              style: theme?.circularStdTextTheme.book.copyWith(
                                                color: ColorsFoundation.backNeutral1,
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
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
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
