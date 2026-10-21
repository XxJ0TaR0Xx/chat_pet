import 'package:chat_pet/presentation/pages/signup/cubit/signup_cubit.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/snack_bar/custom_snack_bar.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    this.userId,
    this.email,
    super.key,
  });
  final String? userId;
  final String? email;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController(text: 'danila');
  final emailController = TextEditingController(text: 'danila20032302@yadnex.ru');
  final passwordController = TextEditingController(text: '20032302');
  final confirmPasswordController = TextEditingController(text: '20032302');

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool obscureTextPassword = true;

  void onEyeTap() {
    obscureTextPassword = !obscureTextPassword;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final theme = context.uiKitTheme;

    return Scaffold(
      body: SafeArea(
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
              child: BlocProvider.value(
                value: cubit,
                child: BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupStateError) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          CustomSnackBar(context, text: state.errorMessage).showErrorMessage();
                        },
                      );
                    }

                    if (state is SignupStateLoaded) {
                      GoRouter.of(context).go(AppRoutes.chats);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: key,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: -5,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final TextPainter painter = TextPainter(
                                      text: TextSpan(
                                        text: S.of(context).Email,
                                        style: theme?.circularStdTextTheme.medium.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.w,
                                        ),
                                      ),
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                    )..layout(maxWidth: constraints.maxWidth);

                                    return Row(
                                      children: [
                                        Text(
                                          S.of(context).SignUpWith,
                                          style: theme?.circularStdTextTheme.medium.copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.w,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Container(
                                          color: ColorsFoundation.primary4,
                                          width: painter.size.width + 7,
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Text(
                                S.of(context).SignUpWithEmail,
                                style: theme?.circularStdTextTheme.medium.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.w,
                                ),
                              ),
                            ],
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace16,
                          Text(
                            S.of(context).GetChattingWithFriends,
                            style: theme?.circularStdTextTheme.book.copyWith(
                              fontSize: 14.w,
                              color: ColorsFoundation.mutedText,
                            ),
                            textAlign: TextAlign.center,
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SizedBox(height: 60.h),
                          UiKitTextField(
                            label: S.of(context).YourName,
                            controller: nameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return S.of(context).ThisFieldCannotBeEmpty;
                              }

                              return null;
                            },
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace30,
                          UiKitTextField(
                            label: S.of(context).YourEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return S.of(context).EnterEmail;
                              }

                              final email = text.trim().toLowerCase();

                              final emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

                              if (!emailRegex.hasMatch(email)) {
                                return S.of(context).EnterValidEmail;
                              }

                              if (!email.contains('@')) {
                                return S.of(context).EmailMustContainAt;
                              }

                              final parts = email.split('@');
                              final domain = parts[1];

                              if (!domain.contains('.') || domain.startsWith('.') || domain.endsWith('.')) {
                                return S.of(context).InvalidDomain;
                              }

                              return null;
                            },
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace30,
                          UiKitTextField(
                            label: S.of(context).Password,
                            controller: passwordController,
                            obscureText: obscureTextPassword,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return S.of(context).ThisFieldCannotBeEmpty;
                              }

                              if (text.trim().length < 6) {
                                return S.of(context).PasswordMinLength;
                              }

                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: onEyeTap,
                              child: Icon(
                                obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                                color: theme?.colorScheme.primary,
                              ),
                            ),
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace30,
                          UiKitTextField(
                            label: S.of(context).ConfirmPassword,
                            obscureText: obscureTextPassword,
                            controller: confirmPasswordController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return S.of(context).ThisFieldCannotBeEmpty;
                              }

                              if (text.trim().length < 6) {
                                return S.of(context).PasswordMinLength;
                              }

                              if (text.trim() != passwordController.text.trim()) {
                                return S.of(context).PasswordsDoNotMatch;
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: onEyeTap,
                              child: Icon(
                                obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                                color: theme?.colorScheme.primary,
                              ),
                            ),
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace30,
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: UiKitButton.primary(
                                  text: S.of(context).CreateAnAccount,
                                  isLoading: state is SignupStateLoading,
                                  onTap: () {
                                    if (key.currentState?.validate() ?? false) {
                                      cubit.onSignup(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                          SpacingFoundation.verticalSpace30,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
