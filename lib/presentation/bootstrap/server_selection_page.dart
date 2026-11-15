import 'package:chat_pet/core/config/api_config.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class ServerSelectionPage extends StatelessWidget {
  const ServerSelectionPage({required this.initializing, required this.failed, required this.onSelected, super.key});

  final bool initializing;
  final bool failed;
  final ValueChanged<ApiConfig> onSelected;

  static const _maxPanelWidth = 480.0;

  @override
  Widget build(BuildContext context) {
    final typography = context.uiKitTheme!.carosTextTheme;
    final strings = S.of(context);
    final prod = ApiConfig.prod();
    final dev = ApiConfig.dev();

    return Scaffold(
      backgroundColor: ColorsFoundation.backHelloPage,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsFoundation.purpleLinearColor1,
              ColorsFoundation.purpleLinearColor2,
              ColorsFoundation.backHelloPage,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.all(EdgeInsetsFoundation.all24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: SpacingFoundation.horizontalSpacing8,
                        children: [
                          ChatPetIcon.icon(AppIcons.chatBox, color: ColorsFoundation.surfaceBase),
                          Text(strings.Chatbox, style: typography.mediumBold.copyWith(color: ColorsFoundation.surfaceBase)),
                        ],
                      ),
                      SizedBox(height: SpacingFoundation.verticalSpacing32),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: _maxPanelWidth),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(EdgeInsetsFoundation.all24),
                          decoration: BoxDecoration(
                            color: ColorsFoundation.surfaceBase,
                            borderRadius: BorderRadius.circular(SpacingFoundation.horizontalSpacing24),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: SpacingFoundation.verticalSpacing16,
                            children: [
                              if (!initializing || failed)
                                Text(
                                  failed ? strings.ServerInitializationFailed : strings.SelectServer,
                                  style: typography.boldTitle.copyWith(color: ColorsFoundation.darkNeutral),
                                ),
                              if (failed)
                                _StartupStatus(message: strings.RestartAfterInitializationFailure, failed: true)
                              else if (initializing)
                                _StartupStatus(message: strings.InitializingApplication)
                              else ...[
                                Text(
                                  strings.SelectServerDescription,
                                  style: typography.medium.copyWith(color: ColorsFoundation.mutedText, height: 1.5),
                                ),
                                _ServerOption(
                                  title: strings.ProductionServer,
                                  address: prod.baseUrl,
                                  icon: Icons.cloud_outlined,
                                  primary: true,
                                  onTap: () => onSelected(prod),
                                ),
                                _ServerOption(
                                  title: strings.DevelopmentServer,
                                  address: dev.baseUrl,
                                  icon: Icons.code_rounded,
                                  onTap: () => onSelected(dev),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ServerOption extends StatelessWidget {
  const _ServerOption({required this.title, required this.address, required this.icon, required this.onTap, this.primary = false});

  final String title;
  final String address;
  final IconData icon;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final typography = context.uiKitTheme!.carosTextTheme;
    final radius = BorderRadius.circular(SpacingFoundation.horizontalSpacing16);

    return Semantics(
      button: true,
      child: Material(
        color: primary ? ColorsFoundation.primary4 : ColorsFoundation.lightSurface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: primary ? ColorsFoundation.primary : ColorsFoundation.backNeutral3),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingFoundation.horizontalSpacing12,
              children: [
                Icon(icon, color: primary ? ColorsFoundation.primary5 : ColorsFoundation.mutedText),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SpacingFoundation.verticalSpacing8,
                    children: [
                      Text(title, style: typography.mediumBold.copyWith(color: ColorsFoundation.darkNeutral)),
                      Text(address, style: typography.mediumBold12.copyWith(color: ColorsFoundation.mutedText, height: 1.5)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_rounded, color: ColorsFoundation.darkNeutral),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartupStatus extends StatelessWidget {
  const _StartupStatus({required this.message, this.failed = false});

  final String message;
  final bool failed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingFoundation.verticalSpacing24,
      children: [
        if (failed)
          const Icon(Icons.error_outline_rounded, color: ColorsFoundation.error)
        else
          const CircularProgressIndicator(color: ColorsFoundation.primary),
        Text(message, style: context.uiKitTheme!.carosTextTheme.medium.copyWith(color: ColorsFoundation.mutedText, height: 1.5)),
      ],
    );
  }
}
