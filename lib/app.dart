import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/usecases/auth/login_by_google_usecase.dart';
import 'package:chat_pet/domain/usecases/auth/login_usecase.dart';
import 'package:chat_pet/domain/usecases/auth/logout_usecase.dart';
import 'package:chat_pet/domain/usecases/auth/register_usecase.dart';
import 'package:chat_pet/domain/usecases/user/update_user_usecase.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/home/cubit/navigation_cubit.dart';
import 'package:chat_pet/presentation/pages/login/cubit/login_cubit.dart';
import 'package:chat_pet/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:chat_pet/presentation/pages/settings/cubit/setting_cubit.dart';
import 'package:chat_pet/presentation/pages/signup/cubit/signup_cubit.dart';
import 'package:chat_pet/presentation/pages/start/auth_wrapper.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:chat_pet/presentation/utils/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationCubit()),
          BlocProvider(create: (_) => UserCubit()),
          BlocProvider(
            create: (_) => ProfileCubit(getIt.get<UpdateUserUseCase>(), userCubit: getIt<UserCubit>()),
          ),
          BlocProvider(create: (_) => SignupCubit(getIt.get<RegisterUseCase>())),
          BlocProvider(create: (_) => LoginCubit(getIt.get<LoginUseCase>(), getIt.get<LoginByGoogleUseCase>())),
          BlocProvider(create: (_) => SettingCubit(getIt.get<LogoutUseCase>(), userCubit: getIt<UserCubit>())),
        ],
        child: MaterialApp(
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: UiKitThemes().defaultThemeData,
          home: AuthWrapper(),
        ),
      ),
    );
  }
}
