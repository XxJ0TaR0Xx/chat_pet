import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/domain/usecases/auth/init_use_case.dart';
import 'package:chat_pet/domain/usecases/auth/login_use_case.dart';
import 'package:chat_pet/domain/usecases/auth/registration_use_case.dart';
import 'package:chat_pet/domain/usecases/users/get_me_use_case.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/signup/cubit/signup_cubit.dart';
import 'package:chat_pet/presentation/route/route_configuration.dart';
import 'package:chat_pet/presentation/ui_kit/theme/ui_kit_theme.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:chat_pet/presentation/utils/behavior/my_behavior.dart';
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
          BlocProvider(create: (_) => UserCubit(getIt.get<GetMeUseCase>(), getIt.get<InitUseCase>())),
          BlocProvider(create: (_) => SignupCubit(getIt.get<RegistrationUseCase>(), getIt.get<LoginUseCase>())),
        ],
        child: Builder(
          builder: (context) {
            final router = RouteConfiguration.router(context);

            return MaterialApp.router(
              routerConfig: router,
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
            );
          },
        ),
      ),
    );
  }
}
