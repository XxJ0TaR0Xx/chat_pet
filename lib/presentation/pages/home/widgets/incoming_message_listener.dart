import 'dart:async';

import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/core/localization/l10n.dart';
import 'package:chat_pet/presentation/cubits/user/user_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/chat_cubit.dart';
import 'package:chat_pet/presentation/pages/chats/cubit/incoming_chat_message.dart';
import 'package:chat_pet/presentation/route/app_routes.dart';
import 'package:chat_pet/presentation/ui_kit/molecule/notifications/incoming_message_banner_overlay.dart';
import 'package:chat_pet/presentation/utils/chat_session/open_chat_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Живёт внутри HomeScope на протяжении всей авторизованной сессии
/// (переключение вкладок его не пересоздаёт — StatefulShellRoute держит
/// HomePage как единственный persistent-виджет над IndexedStack'ом веток).
///
/// Подписывается на [ChatCubit.incomingMessages] и превращает каждое новое
/// сообщение в чужом чате в баннер поверх текущего экрана — включая случай,
/// когда сверху запушен другой роут (MessagePage, ProfilePage и т.п.), т.к.
/// баннер рисуется в root-Overlay, а не привязан к конкретному route.
class IncomingMessageListener extends StatefulWidget {
  const IncomingMessageListener({required this.child, super.key});

  final Widget child;

  @override
  State<IncomingMessageListener> createState() => _IncomingMessageListenerState();
}

class _IncomingMessageListenerState extends State<IncomingMessageListener> {
  StreamSubscription<IncomingChatMessage>? _subscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscription ??= context.read<ChatCubit>().incomingMessages.listen(_handleIncomingMessage);
  }

  void _handleIncomingMessage(IncomingChatMessage event) {
    final currentUserId = getIt<UserCubit>().state.user?.id;
    if (currentUserId == null || event.message.senderId == currentUserId) return;

    // Пользователь уже читает этот чат — сообщение и так видно живьём внутри MessagePage.
    if (getIt<OpenChatTracker>().openChatId.value == event.chat.id) return;

    IncomingMessageBannerOverlay.show(
      context,
      title: event.chat.displayName ?? S.of(context).NewMessage,
      message: event.message.content,
      avatarUrl: event.chat.avatarUrl,
      onTap: () => _openChat(event, currentUserId),
    );
  }

  void _openChat(IncomingChatMessage event, String currentUserId) {
    context.read<ChatCubit>().clearUncheckedMessageCount(event.chat.id);

    GoRouter.of(context).push(
      AppRoutes.chatId.replaceFirst(':id', event.chat.id),
      extra: event.chat.members.firstWhere((member) => member.id != currentUserId),
    );
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
