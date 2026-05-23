import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_pet/presentation/pages/login/login_page.dart';
import 'package:chat_pet/presentation/pages/signup/signup_page.dart';
import 'package:chat_pet/presentation/pages/start/widgets/gradient_ellipse_painter.dart';
import 'package:chat_pet/presentation/pages/start/widgets/or_row_widget.dart';
import 'package:chat_pet/presentation/pages/start/widgets/social_links_widget.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

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
              children: [
                SpacingFoundation.verticalSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChatPetIcon.icon(
                      AppIcons.chatBox,
                      color: Colors.white,
                      size: 16.w,
                    ),
                    SpacingFoundation.horizontalSpace6,
                    Text(
                      S.of(context).Chatbox,
                      style: theme?.circularStdTextTheme.medium.copyWith(
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
                  style: theme?.carosTextTheme.medium.copyWith(
                    fontSize: 68.w,
                    color: ColorsFoundation.lightSurface,
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                Text(
                  S.of(context).OurChatAppIsThePerfectWay,
                  style: theme?.circularStdTextTheme.medium.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 18.w,
                    height: 1.5,
                    color: ColorsFoundation.mutedText,
                    shadows: [
                      Shadow(offset: Offset(-1, -1)),
                      Shadow(offset: Offset(1, -1)),
                      Shadow(offset: Offset(1, 1)),
                      Shadow(offset: Offset(-1, 1)),
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
                        text: S.of(context).LogIn,
                        onTap: () => context.push(LoginPage()),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: SpacingFoundation.horizontalSpacing4,
                  children: [
                    Text(
                      'Нет аккаута?',
                      style: theme?.circularStdTextTheme.medium.copyWith(
                        color: ColorsFoundation.mutedText,
                        fontSize: 13.w,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push(SignupPage()),
                      child: Text(
                        S.of(context).SignUpWithEmail,
                        style: theme?.circularStdTextTheme.medium.copyWith(
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
