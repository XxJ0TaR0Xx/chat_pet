import 'package:chat_pet/pages/start_page/widgets/or_row_widget.dart';
import 'package:chat_pet/pages/start_page/widgets/social_links_widget.dart';
import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final TextPainter painter = TextPainter(
                              text: TextSpan(
                                text: S.of(context).LogIn,
                                style: theme?.circularStdTextTheme.captionMedium.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.w,
                                ),
                              ),
                              maxLines: 1,
                              textDirection: TextDirection.ltr,
                            )..layout(minWidth: 0, maxWidth: constraints.maxWidth);

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
                        style: theme?.circularStdTextTheme.captionMedium.copyWith(
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
                    style: theme?.circularStdTextTheme.captionBook.copyWith(
                      color: ColorsFoundation.backNeutral1,
                      fontSize: 14.w,
                    ),
                  ),
                  SpacingFoundation.verticalSpace30,
                  SocialLinksWidget(borderColor: ColorsFoundation.darkNeutral),
                  SpacingFoundation.verticalSpace30,
                  OrRowWidget(
                    textColor: ColorsFoundation.backNeutral1,
                  ),
                  SpacingFoundation.verticalSpace30,
                  UiKitTextField(
                    controller: TextEditingController(),
                    label: S.of(context).YourEmail,
                  ),
                  SpacingFoundation.verticalSpace30,
                  UiKitTextField(
                    controller: TextEditingController(),
                    label: S.of(context).Password,
                    obscureText: true,
                  ),
                  SpacingFoundation.verticalSpace30,
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: UiKitButton.primary(
                          text: S.of(context).LogIn,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SpacingFoundation.verticalSpace16,
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                      minimumSize: WidgetStatePropertyAll<Size>(Size.zero),
                    ),
                    child: Text(
                      S.of(context).ForgotPassword,
                      style: theme?.circularStdTextTheme.captionBook.copyWith(
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
          ],
        ),
      ),
    );
  }
}
