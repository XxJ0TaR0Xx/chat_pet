import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/dialogs/exit_dialog.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          UiKitAppBar(
            showLeading: false,
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
            child: BlocConsumer<SettingCubit, SettingState>(
              listener: (context, state) {
                if (state is SettingStateLoaded && state.transientError != null) {
                  CustomSnackBar(context, text: state.transientError!).showErrorMessage();
                }
              },
              builder: (context, state) {
                return state.when(
                  loading: LoadingWidget.new,
                  error: (errorMessage) => Column(
                    children: [
                      const Spacer(),
                      Text(
                        errorMessage,
                        style: context.uiKitTheme?.carosTextTheme.bold.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing16),
                      const Spacer(),
                    ],
                  ),
                  loaded: (userModel, _) => BottomSheetWidget(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpacingFoundation.verticalSpace24,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.w,
                            backgroundImage: userModel.avatarUrl != null
                                ? NetworkImage(userModel.avatarUrl!)
                                : const AssetImage('assets/images/orig.png'),
                          ),
                          SpacingFoundation.horizontalSpace24,
                          Column(
                            mainAxisSize: .min,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                '${userModel.name ?? S.of(context).NotFounded} ${userModel.lastName ?? ''}',
                                style: theme?.carosTextTheme.bold.copyWith(
                                  fontSize: 20.w,
                                ),
                              ),
                              SpacingFoundation.verticalSpace6,
                              //TODO add from server
                              Text(
                                S.of(context).DefaultUserStatus,
                                style: theme?.circularStdTextTheme.book.copyWith(
                                  fontSize: 12.w,
                                  color: ColorsFoundation.backNeutral1,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ChatPetIcon.icon(
                            AppIcons.qrCode,
                            color: ColorsFoundation.primary,
                            size: 24.w,
                          ),
                        ],
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                      SpacingFoundation.verticalSpace20,
                      const Divider(color: ColorsFoundation.backNeutral1),
                      SpacingFoundation.verticalSpace4,
                      _SettingsItem(
                        title: S.of(context).Account,
                        description: S.of(context).PrivacySecurityChange,
                        icon: AppIcons.keys,
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.settingsProfile);
                        },
                      ),
                      _SettingsItem(
                        title: S.of(context).Chat,
                        description: S.of(context).ChatHistoryThemeWallpapers,
                        icon: AppIcons.message,
                        onTap: () => _underDeveloped(context),
                      ),
                      _SettingsItem(
                        title: S.of(context).Notifications,
                        icon: AppIcons.notifications,
                        onTap: () => _underDeveloped(context),
                      ),
                      _SettingsItem(
                        title: S.of(context).Help,
                        description: S.of(context).HelpCenter,
                        icon: AppIcons.help,
                        onTap: () => _underDeveloped(context),
                      ),
                      _SettingsItem(
                        title: S.of(context).StorageAndData,
                        description: S.of(context).NetworkUsage,
                        icon: AppIcons.data,
                        onTap: () => _underDeveloped(context),
                      ),
                      _SettingsItem(
                        title: S.of(context).InviteAFriend,
                        icon: AppIcons.users,
                        onTap: () => _underDeveloped(context),
                      ),
                      _SettingsItem(
                        title: S.of(context).LogOutOfYouAccount,
                        isDestructive: true,
                        icon: AppIcons.arrowBack,
                        onTap: () async {
                          await exitDialog(
                            context,
                            onNoTap: () => GoRouter.of(context).pop(),
                            onYesTap: () => context.read<SettingCubit>().logout(),
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

  void _underDeveloped(BuildContext context) => CustomSnackBar(context, text: S.of(context).UnderDevelopment).showDevMessage();
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.description,
    this.isDestructive = false,
  });

  final String title;
  final AppIcons icon;
  final VoidCallback onTap;
  final String? description;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final color = isDestructive ? ColorsFoundation.red : ColorsFoundation.backNeutral1;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child:
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.09),
                    shape: BoxShape.circle,
                  ),
                  child: ChatPetIcon.icon(
                    icon,
                    color: color,
                  ).paddingAll(EdgeInsetsFoundation.all8),
                ),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SpacingFoundation.verticalSpacing6,
                    children: [
                      Text(
                        title,
                        style: theme?.carosTextTheme.bold.copyWith(
                          color: isDestructive ? ColorsFoundation.red : null,
                        ),
                      ),
                      if (description != null && description!.isNotEmpty)
                        Text(
                          description!,
                          style: theme?.circularStdTextTheme.book.copyWith(
                            color: color,
                            fontSize: 12.w,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(
              horizontal: SpacingFoundation.horizontalSpacing24,
              vertical: SpacingFoundation.verticalSpacing16,
            ),
      ),
    );
  }
}
