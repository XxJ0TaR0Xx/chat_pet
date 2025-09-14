import 'package:chat_pet/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                                style: theme?.circularStdTextTheme.captionMedium.copyWith(
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
                                  style: theme?.circularStdTextTheme.captionMedium.copyWith(
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
                        style: theme?.circularStdTextTheme.captionMedium.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.w,
                        ),
                      ),
                    ],
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace16,
                  Text(
                    S.of(context).GetChattingWithFriends,
                    style: theme?.circularStdTextTheme.captionBook.copyWith(
                      fontSize: 14.w,
                      color: ColorsFoundation.mutedText,
                    ),
                    textAlign: TextAlign.center,
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SizedBox(height: 60.h),
                  UiKitTextField(
                    label: S.of(context).YourName,
                    controller: TextEditingController(),
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace30,
                  UiKitTextField(
                    label: S.of(context).YourEmail,
                    controller: TextEditingController(),
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace30,
                  UiKitTextField(
                    label: S.of(context).Password,
                    controller: TextEditingController(),
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace30,
                  UiKitTextField(
                    label: S.of(context).ConfirmPassword,
                    controller: TextEditingController(),
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace30,
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: UiKitButton.primary(
                          text: S.of(context).CreateAnAccount,
                          isDisable: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
                  SpacingFoundation.verticalSpace30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
