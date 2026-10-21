import 'dart:async';

import 'package:chat_pet/presentation/ui_kit/molecule/notifications/incoming_message_banner.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

/// Показывает [IncomingMessageBanner] поверх ЛЮБОГО текущего экрана через
/// root-[Overlay], а не через ScaffoldMessenger/SnackBar.
///
/// SnackBar требует Scaffold-предка и привязан к текущему route — баннер же
/// должен быть виден независимо от того, какой экран сейчас на вершине стека
/// (список чатов, открытый чат другого собеседника, профиль и т.д.), поэтому
/// используется отдельный OverlayEntry в rootOverlay, общий для всех роутов
/// приложения.
class IncomingMessageBannerOverlay {
  IncomingMessageBannerOverlay._();

  static OverlayEntry? _entry;

  static void show(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onTap,
    String? avatarUrl,
  }) {
    hide();

    final overlayState = Overlay.of(context, rootOverlay: true);

    final entry = OverlayEntry(
      builder: (context) => _AnimatedBanner(
        title: title,
        message: message,
        avatarUrl: avatarUrl,
        onTap: () {
          hide();
          onTap();
        },
        onDismissed: hide,
      ),
    );

    _entry = entry;
    overlayState.insert(entry);
  }

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}

class _AnimatedBanner extends StatefulWidget {
  const _AnimatedBanner({
    required this.title,
    required this.message,
    required this.onTap,
    required this.onDismissed,
    this.avatarUrl,
  });

  final String title;
  final String message;
  final String? avatarUrl;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  @override
  State<_AnimatedBanner> createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<_AnimatedBanner> with SingleTickerProviderStateMixin {
  static const _autoDismissDelay = Duration(seconds: 4);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );
  late final Animation<Offset> _offset = Tween(
    begin: const Offset(0, -1.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  Timer? _autoDismissTimer;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _autoDismissTimer = Timer(_autoDismissDelay, _dismissWithAnimation);
  }

  Future<void> _dismissWithAnimation() async {
    if (_isClosing) return;
    _isClosing = true;
    _autoDismissTimer?.cancel();
    await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing16).copyWith(
            top: SpacingFoundation.verticalSpacing8,
          ),
          child: SlideTransition(
            position: _offset,
            child: Dismissible(
              key: const ValueKey('incoming_message_banner'),
              direction: DismissDirection.up,
              onDismissed: (_) {
                _isClosing = true;
                _autoDismissTimer?.cancel();
                widget.onDismissed();
              },
              child: IncomingMessageBanner(
                title: widget.title,
                message: widget.message,
                avatarUrl: widget.avatarUrl,
                onTap: widget.onTap,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
