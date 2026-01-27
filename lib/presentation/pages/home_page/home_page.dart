import 'package:chat_pet/presentation/pages/messages_page/messages_page.dart';
import 'package:chat_pet/presentation/pages/settings_page/settings_page.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      backgroundColor: theme?.colorScheme.darkNeutral,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: theme?.colorScheme.surfaceBase,
        ),
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationBarItem(
                  icon: AppIcons.message,
                  title: S.of(context).Message,
                  isActive: index == 0,
                  onTap: () {
                    index = 0;
                    setState(() {});
                  },
                ),
                BottomNavigationBarItem(
                  icon: AppIcons.calls,
                  title: S.of(context).Calls,
                  isActive: index == 1,
                  onTap: () {
                    index = 1;
                    setState(() {});
                  },
                ),
                BottomNavigationBarItem(
                  icon: AppIcons.contacts,
                  title: S.of(context).Contacts,
                  isActive: index == 2,
                  onTap: () {
                    index = 2;
                    setState(() {});
                  },
                ),
                BottomNavigationBarItem(
                  icon: AppIcons.settings,
                  title: S.of(context).Settings,
                  isActive: index == 3,
                  onTap: () {
                    index = 3;
                    setState(() {});
                  },
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
        1 => Placeholder(),
        2 => Placeholder(),
        3 => SettingsPage(),
        _ => Placeholder(),
      },
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem({
    required this.title,
    required this.icon,
    super.key,
    this.isActive = false,
    this.onTap,
  });

  final String title;
  final AppIcons icon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? ColorsFoundation.primary : ColorsFoundation.backNeutral1;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChatPetIcon.icon(
            icon,
            color: color,
            size: 26.w,
          ),
          SpacingFoundation.verticalSpace6,
          Text(
            title,
            style: context.uiKitTheme?.carosTextTheme.bold.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
