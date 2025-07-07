// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

final log = Logger(printer: PrettyPrinter());

final logNoStack = Logger(printer: PrettyPrinter(methodCount: 0));
