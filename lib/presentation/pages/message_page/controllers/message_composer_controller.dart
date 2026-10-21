import 'package:chat_pet/domain/models/messages/message_model.dart';
import 'package:flutter/widgets.dart';

sealed class ComposerMode {
  const ComposerMode();
}

final class ComposerModeIdle extends ComposerMode {
  const ComposerModeIdle();
}

sealed class ComposerTarget extends ComposerMode {
  const ComposerTarget(this.message);

  final MessageModel message;
}

final class ComposerEditing extends ComposerTarget {
  const ComposerEditing(super.message);
}

final class ComposerReply extends ComposerTarget {
  const ComposerReply(super.message, {required this.authorName});

  final String authorName;
}

class MessageComposerController extends ValueNotifier<ComposerMode> {
  MessageComposerController() : super(const ComposerModeIdle());

  final TextEditingController controller = TextEditingController();

  void syncTarget(MessageModel? Function(String id) findById) {
    final mode = value;
    if (mode is! ComposerTarget) return;

    final actual = findById(mode.message.id);
    if (actual == null) return cancel();
    if (actual == mode.message) return;

    value = switch (mode) {
      ComposerEditing() => ComposerEditing(actual),
      ComposerReply(:final authorName) => ComposerReply(actual, authorName: authorName),
    };
  }

  void startEditing(MessageModel message) {
    value = ComposerEditing(message);
    controller.value = TextEditingValue(
      text: message.content,
      selection: TextSelection.collapsed(offset: message.content.length),
    );
  }

  void startReply(MessageModel message, {required String authorName}) {
    if (value is ComposerEditing) controller.clear();
    value = ComposerReply(message, authorName: authorName);
  }

  void cancel() {
    value = const ComposerModeIdle();
    controller.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
