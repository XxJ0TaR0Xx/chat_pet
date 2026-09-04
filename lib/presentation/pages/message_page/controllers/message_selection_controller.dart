import 'package:flutter/cupertino.dart';

class MessageSelectionController extends ValueNotifier<Set<String>> {
  MessageSelectionController() : super(const {});

  bool get isActive => value.isNotEmpty;
  int get count => value.length;
  bool contains(String id) => value.contains(id);

  void select(String id) {
    value = value.contains(id) ? ({...value}..remove(id)) : ({...value, id});
  }

  void clear() {
    if (value.isEmpty) return;
    value = const {};
  }
}
