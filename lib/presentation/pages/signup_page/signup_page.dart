import 'package:chat_pet/presentation/pages/signup_page/bloc/signup_bloc.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureTextPassword = true;

  onEyeTap() {
    obscureTextPassword = !obscureTextPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: ColorsFoundation.darkNeutral,
              automaticallyImplyLeading: false,
              flexibleSpace: UiKitAppBar(),
            ),
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) => SliverFillRemaining(
                hasScrollBody: false,
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
                              )..layout(minWidth: 0, maxWidth: constraints.maxWidth);

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
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                    SpacingFoundation.verticalSpace30,
                    UiKitTextField(
                      label: S.of(context).YourEmail,
                      controller: emailController,
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                    SpacingFoundation.verticalSpace30,
                    UiKitTextField(
                      label: S.of(context).Password,
                      controller: passwordController,
                      obscureText: obscureTextPassword,
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
                      suffixIcon: GestureDetector(
                        onTap: onEyeTap,
                        child: Icon(
                          obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                          color: theme?.colorScheme.primary,
                        ),
                      ),
                    ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                    SpacingFoundation.verticalSpace30,
                    Spacer(),
                    if (state is SignupLoading)
                      SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: CircularProgressIndicator(
                          color: theme?.colorScheme.primary,
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: UiKitButton.primary(
                              text: S.of(context).CreateAnAccount,
                              isDisable: false,
                              onTap: () {
                                context.read<SignupBloc>().add(
                                      SignupSubmittedEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ],
                      ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                    SpacingFoundation.verticalSpace30,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
