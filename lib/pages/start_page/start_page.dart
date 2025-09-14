import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_pet/pages/login_page/login_page.dart';
import 'package:chat_pet/pages/signup_page/signup_page.dart';
import 'package:chat_pet/pages/start_page/widgets/or_row_widget.dart';
import 'package:chat_pet/pages/start_page/widgets/social_links_widget.dart';
import 'package:chat_pet/ui_kit/molecule/ui_kit_button.dart';
import 'package:flutter/material.dart';

import 'package:chat_pet/pages/start_page/widgets/gradient_ellipse_painter.dart';
import 'package:chat_pet/ui_kit/ui_kit.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _colorAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      backgroundColor: ColorsFoundation.backHelloPage,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: 1.sw,
              height: 0.5.sh,
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: GradientEllipsePainter(
                      animationValue: _colorAnimation.value,
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SpacingFoundation.verticalSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      ChatPetIcons.subtract,
                      color: Colors.white,
                      weight: 16.w,
                    ),
                    SpacingFoundation.horizontalSpace6,
                    Text(
                      S.of(context).Chatbox,
                      style: theme?.circularStdTextTheme.captionMedium.copyWith(
                        color: ColorsFoundation.lightSurface,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                AutoSizeText(
                  S.of(context).ConnectFriendsEasilyQuickly,
                  maxLines: 4,
                  wrapWords: false,
                  style: theme?.carosTextTheme.captionMedium.copyWith(
                    fontSize: 68.w,
                    color: ColorsFoundation.lightSurface,
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                Text(
                  S.of(context).OurChatAppIsThePerfectWay,
                  style: theme?.circularStdTextTheme.captionBook.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 18.w,
                    color: ColorsFoundation.mutedText,
                    shadows: [
                      Shadow(
                        offset: Offset(-1, -1),
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(1, -1),
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(-1, 1),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                SocialLinksWidget(
                  isWhiteBackground: false,
                ),
                SpacingFoundation.verticalSpace30,
                OrRowWidget(),
                SpacingFoundation.verticalSpace30,
                Row(
                  children: [
                    Expanded(
                      child: UiKitButton(
                        text: S.of(context).SignUpWithMail,
                        onTap: () => context.push(SignupPage()),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).ExistingAccount,
                      style: theme?.circularStdTextTheme.captionMedium.copyWith(
                        color: ColorsFoundation.mutedText,
                        fontSize: 13.w,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push(LoginPage()),
                      child: Text(
                        S.of(context).LogIn,
                        style: theme?.circularStdTextTheme.captionMedium.copyWith(
                          color: ColorsFoundation.surfaceBase,
                          fontSize: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ).paddingHorizontal(SpacingFoundation.horizontalSpacing24),
          ],
        ),
      ),
    );
  }
}
