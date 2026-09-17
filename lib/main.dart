import 'package:chat_pet/app.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/common/services/api_service.dart';
import 'package:chat_pet/presentation/cubits/cubit_talker/cubit_talker.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "general_configs.env");
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    providerAndroid: kReleaseMode ? const AndroidPlayIntegrityProvider() : const AndroidDebugProvider(),
    providerApple: kReleaseMode ? const AppleAppAttestWithDeviceCheckFallbackProvider() : const AppleDebugProvider(),
  );
  configureDependencies();
  CubitTalker.init();
  APIService.init();
  getIt.registerSingleton<Dio>(APIService.instants.dio);

  runApp(const App());
}
