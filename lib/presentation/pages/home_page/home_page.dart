import 'package:chat_pet/presentation/pages/home_page/cubit/navigation_cubit.dart';
import 'package:chat_pet/presentation/pages/home_page/widgets/bottom_navigation_icon.dart';
import 'package:chat_pet/presentation/pages/messages_page/messages_page.dart';
import 'package:chat_pet/presentation/pages/settings_page/settings_page.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocBuilder<NavigationCubit, int>(
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
          0 => MessagesPage(),
          1 => _CallsPagePlaceholder(),
          2 => _ContactsPagePlaceholder(),
          3 => SettingsPage(),
          int() => throw UnimplementedError(),
        },
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
