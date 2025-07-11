import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.svg.facebookLogo.path,
                    Assets.images.svg.googleLogo.path,
                    Assets.images.svg.appleLogo.path
                  ].map(
                    (e) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: ColorsFoundation.grayColor,
                          ),
                        ),
                        child: SvgPicture.asset(
                          e,
                          width: 42.w,
                          height: 42.w,
                          fit: BoxFit.fill,
                        ).paddingAll(EdgeInsetsFoundation.all4),
                      ).paddingOnly(
                        right: e != Assets.images.svg.appleLogo.path ? SpacingFoundation.horizontalSpacing20 : 0,
                      );
                    },
                  ).toList(),
                ),
                SpacingFoundation.verticalSpace30,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorsFoundation.backNeutral3,
                        thickness: 0.5.w,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace16,
                    Text(
                      S.of(context).Or.toUpperCase(),
                      style: theme?.circularStdTextTheme.captionMedium.copyWith(
                        color: ColorsFoundation.textColor,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace16,
                    Expanded(
                      child: Divider(
                        color: ColorsFoundation.backNeutral3,
                        thickness: 0.5.w,
                      ),
                    ),
                  ],
                ),
                SpacingFoundation.verticalSpace30,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                            return ColorsFoundation.surfaceBase;
                          }),
                        ),
                        child: Text(
                          S.of(context).SignUpWithMail,
                          style: theme?.carosTextTheme.captionMedium.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ).paddingVertical(SpacingFoundation.verticalSpacing16),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).ExistingAccount,
                        style: theme?.circularStdTextTheme.captionMedium.copyWith(
                          color: ColorsFoundation.mutedText,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).LogIn,
                        style: theme?.circularStdTextTheme.captionMedium.copyWith(
                          color: ColorsFoundation.surfaceBase,
                        ),
                      ),
                    ],
                  ),
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
