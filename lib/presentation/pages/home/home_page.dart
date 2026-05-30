import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/usecases/auth/logout_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/home/widgets/bottom_navigation_icon.dart';
import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            logoutUseCase: getIt.get<LogoutUseCase>(),
            userCubit: context.read<UserCubit>(),
          ),
        ),
        BlocProvider(
          create: (_) => ChatCubit(userCubit: context.read<UserCubit>()),
        ),
      ],
      child: child,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final currentIndex = navigationShell.currentIndex;

    return HomeScope(
      child: Scaffold(
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
                    isActive: currentIndex == 0,
                    onTap: () => _onTabSelected(0),
                  ),
                  BottomNavigationIcon(
                    icon: AppIcons.calls,
                    title: S.of(context).Calls,
                    isActive: currentIndex == 1,
                    onTap: () => _onTabSelected(1),
                  ),
                  BottomNavigationIcon(
                    icon: AppIcons.contacts,
                    title: S.of(context).Contacts,
                    isActive: currentIndex == 2,
                    onTap: () => _onTabSelected(2),
                  ),
                  BottomNavigationIcon(
                    icon: AppIcons.settings,
                    title: S.of(context).Settings,
                    isActive: currentIndex == 3,
                    onTap: () => _onTabSelected(3),
                  ),
                ],
              ).paddingOnly(
                left: SpacingFoundation.horizontalSpacing24,
                right: SpacingFoundation.horizontalSpacing24,
                top: SpacingFoundation.verticalSpacing16,
                bottom: SpacingFoundation.verticalSpacing24,
              ),
        ),
        body: navigationShell,
      ),
    );
  }
}
