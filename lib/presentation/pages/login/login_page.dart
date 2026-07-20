import 'package:chat_pet/data/common/custom_talker/custom_talker.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/login/cubit/login_cubit.dart';
import 'package:chat_pet/presentation/pages/start/widgets/or_row_widget.dart';
import 'package:chat_pet/presentation/pages/start/widgets/social_links_widget.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(text: 'danila20032302@yandex.com');
  final TextEditingController _passwordController = TextEditingController(text: '20032302');

  bool obscureTextPassword = true;

  @override
  void initState() {
    super.initState();

    cubit = context.read<LoginCubit>();
  }

  @override
  void dispose() {
    super.dispose();

    cubit.close();
  }

  void onEyeTap() {
    obscureTextPassword = !obscureTextPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: cubit,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: ColorsFoundation.darkNeutral,
                automaticallyImplyLeading: false,
                flexibleSpace: UiKitAppBar(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginStateError) {
                      CustomSnackBar(
                        context,
                        text: 'Ошибка: ${state.errorMessage}',
                      ).showErrorMessage();
                    }
                    if (state is LoginStateLoaded) {
                      talk.info('Успешный логин - переходим на главную страницу');
                      context.read<UserCubit>().getMe();
                      GoRouter.of(context).go(AppRoutes.chats);
                    }
                  },
                  child: Form(
                    key: key,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const Spacer(),
                        Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final TextPainter painter = TextPainter(
                                    text: TextSpan(
                                      text: S.of(context).LogIn,
                                      style: theme?.circularStdTextTheme.medium.copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18.w,
                                      ),
                                    ),
                                    maxLines: 1,
                                    textDirection: TextDirection.ltr,
                                  )..layout(maxWidth: constraints.maxWidth);

                                  return Container(
                                    color: ColorsFoundation.primary4,
                                    width: painter.size.width + 7,
                                    height: 10,
                                  );
                                },
                              ),
                            ),
                            Text(
                              S.of(context).LogInToChatbox,
                              style: theme?.circularStdTextTheme.medium.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 18.w,
                              ),
                            ),
                          ],
                        ),
                        SpacingFoundation.verticalSpace16,
                        Text(
                          S.of(context).WelcomeBackSignInUsing,
                          textAlign: TextAlign.center,
                          style: theme?.circularStdTextTheme.book.copyWith(
                            color: ColorsFoundation.backNeutral1,
                            fontSize: 14.w,
                          ),
                        ),
                        SpacingFoundation.verticalSpace30,
                        SocialLinksWidget(
                          borderColor: ColorsFoundation.darkNeutral,
                          onSocialLinkTap: (socialLinkIcon) {
                            if (socialLinkIcon == AppIcons.google) {
                              cubit.loginByGoogle();
                            }
                          },
                        ),
                        SpacingFoundation.verticalSpace30,
                        const OrRowWidget(textColor: ColorsFoundation.backNeutral1),
                        SpacingFoundation.verticalSpace30,
                        UiKitTextField(
                          controller: _emailController,
                          label: S.of(context).YourEmail,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Это поле не может быть пустым';
                            }

                            return null;
                          },
                        ),
                        SpacingFoundation.verticalSpace30,
                        UiKitTextField(
                          controller: _passwordController,
                          label: S.of(context).Password,
                          obscureText: obscureTextPassword,
                          suffixIcon: GestureDetector(
                            onTap: onEyeTap,
                            child: Icon(
                              obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                              color: theme?.colorScheme.primary,
                            ),
                          ),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Это поле не может быть пустым';
                            }

                            if (text.trim().length < 6) {
                              return 'Минимальная длина пароля 6 символов';
                            }

                            return null;
                          },
                        ),
                        SpacingFoundation.verticalSpace30,
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return UiKitButton.primary(
                                    text: S.of(context).LogIn,
                                    isLoading: state is LoginStateLoading,
                                    onTap: () {
                                      if (key.currentState?.validate() ?? false) {
                                        cubit.login(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SpacingFoundation.verticalSpace12,
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                            minimumSize: WidgetStatePropertyAll<Size>(Size.zero),
                          ),
                          child: Text(
                            S.of(context).ForgotPassword,
                            style: theme?.circularStdTextTheme.book.copyWith(
                              color: ColorsFoundation.primary,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SpacingFoundation.verticalSpace12,
                      ],
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
