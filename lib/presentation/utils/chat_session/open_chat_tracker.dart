import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Держит id чата, который сейчас открыт в MessagePage.
///
/// MessagePage пушится через parentNavigatorKey на root-навигатор — то есть
/// живёт в отдельном от HomeScope поддереве виджетов и не видит cubit'ы,
/// предоставленные внутри HomeScope (ChatCubit и т.д.). Поэтому сигнал
/// "какой чат сейчас открыт" нужен через DI-синглтон, а не через context.
@lazySingleton
class OpenChatTracker {
  final ValueNotifier<String?> _openChatId = ValueNotifier(null);

  ValueListenable<String?> get openChatId => _openChatId;

  void open(String chatId) => _openChatId.value = chatId;

  void close(String chatId) {
    if (_openChatId.value == chatId) _openChatId.value = null;
  }
}
