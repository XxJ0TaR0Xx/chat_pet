import 'package:bloc/bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

abstract class CubitTalker {
  static void init() {
    Bloc.observer = TalkerBlocObserver();
  }
}
