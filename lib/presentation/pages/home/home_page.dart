import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/all_chats_page.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/home/cubit/navigation_cubit.dart';
import 'package:chat_pet/presentation/pages/home/widgets/bottom_navigation_icon.dart';
import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/pages/settings/settings_page.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScope extends StatelessWidget {
  const HomeScope({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingCubit(
            getIt.get<LogoutUseCase>(),
            userCubit: context.read<UserCubit>(),
          ),
        ),
        BlocProvider(
          create: (_) => ChatCubit(context.read<UserCubit>()),
        ),
      ],
      child: child,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NavigationCubit>();
    final theme = context.uiKitTheme;

    return HomeScope(
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, index) => Scaffold(
          backgroundColor: theme?.colorScheme.darkNeutral,
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(
              color: theme?.colorScheme.surfaceBase,
            ),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavigationIcon(
                      icon: AppIcons.message,
                      title: S.of(context).Message,
                      isActive: index == 0,
                      onTap: () => cubit.changeTab(0),
                    ),
                    BottomNavigationIcon(
                      icon: AppIcons.calls,
                      title: S.of(context).Calls,
                      isActive: index == 1,
                      onTap: () => cubit.changeTab(1),
                    ),
                    BottomNavigationIcon(
                      icon: AppIcons.contacts,
                      title: S.of(context).Contacts,
                      isActive: index == 2,
                      onTap: () => cubit.changeTab(2),
                    ),
                    BottomNavigationIcon(
                      icon: AppIcons.settings,
                      title: S.of(context).Settings,
                      isActive: index == 3,
                      onTap: () => cubit.changeTab(3),
                    ),
                  ],
                ).paddingOnly(
                  left: SpacingFoundation.horizontalSpacing24,
                  right: SpacingFoundation.horizontalSpacing24,
                  top: SpacingFoundation.verticalSpacing16,
                  bottom: SpacingFoundation.verticalSpacing24,
                ),
          ),
          body: switch (index) {
            0 => AllChatsPage(),
            1 => _CallsPagePlaceholder(),
            2 => _ContactsPagePlaceholder(),
            3 => SettingsPage(),
            int() => throw UnimplementedError(),
          },
        ),
      ),
    );
  }
}

class _CallsPagePlaceholder extends StatelessWidget {
  const _CallsPagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChatPetIcon.icon(
            AppIcons.calls,
            size: 64.w,
            color: ColorsFoundation.backNeutral1,
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            'Звонки скоро появятся',
            style: context.uiKitTheme?.carosTextTheme.medium.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ContactsPagePlaceholder extends StatelessWidget {
  const _ContactsPagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChatPetIcon.icon(
            AppIcons.contacts,
            size: 64.w,
            color: ColorsFoundation.backNeutral1,
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            'Контакты скоро появятся',
            style: context.uiKitTheme?.carosTextTheme.medium.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
