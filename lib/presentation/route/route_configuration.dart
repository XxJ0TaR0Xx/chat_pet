import 'dart:async';

import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/models/user/user_model.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/all_chats_page.dart';
import 'package:chat_pet/presentation/pages/contacts/contacts_page.dart';
import 'package:chat_pet/presentation/pages/contacts/find_contact/find_contact.dart';
import 'package:chat_pet/presentation/pages/contacts/select_contact/select_contact_page.dart';
import 'package:chat_pet/presentation/pages/home/home_page.dart';
import 'package:chat_pet/presentation/pages/login/cubit/login_cubit.dart';
import 'package:chat_pet/presentation/pages/login/login_page.dart';
import 'package:chat_pet/presentation/pages/map/map_page.dart';
import 'package:chat_pet/presentation/pages/message_page/message_page.dart';
import 'package:chat_pet/presentation/pages/profile/profile_page.dart';
import 'package:chat_pet/presentation/pages/settings/settings_page.dart';
import 'package:chat_pet/presentation/pages/signup/signup_page.dart';
import 'package:chat_pet/presentation/pages/start/start_page.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/common_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class RouteConfiguration {
  static final _rootNavigationKey = GlobalKey<NavigatorState>();

  static GoRouter router(BuildContext context) => _router ?? _createRouter(context);

  static GoRouter? _router;

  static GoRouter _createRouter(BuildContext context) {
    final router = GoRouter(
      navigatorKey: _rootNavigationKey,
      initialLocation: AppRoutes.loading,

      redirect: (context, state) {
        final userState = getIt.get<UserCubit>().state;

        final isAuthFlow = state.matchedLocation.startsWith(AppRoutes.start);
        final isLoading = state.matchedLocation == AppRoutes.loading;

        if (userState.isLoading) {
          return isLoading ? null : AppRoutes.loading;
        }

        if (userState.user == null) {
          return isAuthFlow ? null : AppRoutes.start;
        }

        if (isLoading || isAuthFlow) {
          return AppRoutes.chats;
        }

        return null;
      },
      refreshListenable: GoRouterRefreshBloc(getIt.get<UserCubit>()),
      routes: [
        GoRoute(
          path: AppRoutes.loading,
          builder: (context, state) => const LoadingWidget(),
        ),
        GoRoute(
          path: AppRoutes.start,
          builder: (context, state) => const StartPage(),
          routes: [
            GoRoute(
              path: AppRoutes.loginSegment,
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: getIt.get<LoginCubit>()),
                  BlocProvider.value(value: getIt.get<UserCubit>()),
                ],
                child: const LoginPage(),
              ),
            ),
            GoRoute(
              path: AppRoutes.signUpSegment,
              builder: (context, state) => const SignupPage(),
            ),
          ],
        ),

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomePage(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.chats,
                  builder: (context, state) => const AllChatsPage(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.chatSegment,
                      parentNavigatorKey: _rootNavigationKey,
                      builder: (context, state) => MessagePage(
                        id: state.pathParameters['id']!,
                        interlocutorModel: state.extra as UserModel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.calls,
                  builder: (context, state) => const Center(
                    child: Text('Звонки скоро появятся', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.contacts,
                  builder: (context, state) => const ContactsPage(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.newContacts,
                      parentNavigatorKey: _rootNavigationKey,
                      builder: (context, state) => const FindContact(),
                    ),
                    GoRoute(
                      path: AppRoutes.selectContactSegment,
                      parentNavigatorKey: _rootNavigationKey,
                      builder: (context, state) => const SelectContactPage(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.settings,
                  builder: (context, state) => const SettingsPage(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.profileSegment,
                      parentNavigatorKey: _rootNavigationKey,
                      builder: (context, state) => const ProfilePage(),
                      routes: [
                        GoRoute(
                          path: AppRoutes.map,
                          parentNavigatorKey: _rootNavigationKey,
                          builder: (context, state) => MapPage(oldAddress: state.extra as String?),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

    _router ??= router;
    return router;
  }
}

final class GoRouterRefreshBloc extends ChangeNotifier {
  GoRouterRefreshBloc(BlocBase bloc) {
    _subscription = bloc.stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
