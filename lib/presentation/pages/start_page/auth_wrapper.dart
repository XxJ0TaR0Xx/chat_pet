import 'dart:developer';

import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/repositories/auth_repository.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/home_page/home_page.dart';
import 'package:chat_pet/presentation/pages/start_page/start_page.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<UserCubit>()),
      ],
      child: _AuthWrapperContent(),
    );
  }
}

class _AuthWrapperContent extends StatelessWidget {
  final cubit = getIt<UserCubit>();

  Future<void> _loadUserData(BuildContext context, String userId) async {
    try {
      final authRepo = getIt<AuthRepository>();
      final result = await authRepo.loadUserData(userId);

      result.fold(
        (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Не удалось загрузить данные'),
            ),
          );
        },
        (user) {},
      );
    } catch (e) {
      log('Ошибка загрузки: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, userState) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authSnapshot) {
            if (authSnapshot.connectionState == ConnectionState.waiting) {
              log('1');
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

            if (authSnapshot.hasData && userState is! UserLoaded) {
              log('2');

              WidgetsBinding.instance.addPostFrameCallback((_) {
                _loadUserData(context, authSnapshot.data!.uid);
              });
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

            if (cubit.currentUser != null) {
              log('3');

              return HomePage();
            }
            log('4');

            return const StartPage();
          },
        );
      },
    );
  }
}
