import 'package:chat_pet/app.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:chat_pet/data/common/services/api_service.dart';
import 'package:chat_pet/presentation/cubits/cubit_talker/cubit_talker.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "general_configs.env");
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(providerAndroid: AndroidDebugProvider(debugToken: '35251c2a-a1f5-45c8-bdbc-c537b46cb5eb'));
  configureDependencies();
  CubitTalker.init();
  APIService.init();

  runApp(const App());
}
