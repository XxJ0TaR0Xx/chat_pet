import 'dart:async';

import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/presentation/cubits/contact_request/contact_requests_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/contacts/cubit/contacts_cubit.dart';
import 'package:chat_pet/presentation/pages/home/widgets/bottom_navigation_icon.dart';
import 'package:chat_pet/presentation/pages/home/widgets/incoming_message_listener.dart';
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
        BlocProvider(create: (_) => getIt.get<SettingCubit>()),
        BlocProvider(create: (_) => getIt.get<ChatCubit>()),
        BlocProvider(create: (_) => getIt.get<ContactsCubit>()),
        BlocProvider(create: (_) => getIt<ContactModelRequestsCubit>()),
      ],
      child: child,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onTabSelected(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final currentIndex = widget.navigationShell.currentIndex;

    return HomeScope(
      child: IncomingMessageListener(
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
                    BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        final showBadge = state is ChatStateLoaded ? state.models.any((chat) => chat.unreadCount > 0) : false;

                        return BottomNavigationIcon(
                          icon: AppIcons.message,
                          title: S.of(context).Message,
                          isActive: currentIndex == 0,
                          showBadge: showBadge,
                          onTap: () => _onTabSelected(0),
                        );
                      },
                    ),
                    BottomNavigationIcon(
                      icon: AppIcons.calls,
                      title: S.of(context).Calls,
                      isActive: currentIndex == 1,
                      onTap: () => _onTabSelected(1),
                    ),
                    BlocBuilder<ContactModelRequestsCubit, ContactModelRequestState>(
                      builder: (context, state) => BottomNavigationIcon(
                        icon: AppIcons.contacts,
                        title: S.of(context).Contacts,
                        isActive: currentIndex == 2,
                        onTap: () {
                          unawaited(context.read<ContactModelRequestsCubit>().refresh());
                          _onTabSelected(2);
                        },
                        showBadge: state.hasPending,
                      ),
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
          body: widget.navigationShell,
        ),
      ),
    );
  }
}
