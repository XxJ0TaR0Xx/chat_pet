import 'package:chat_pet/app.dart';
import 'package:chat_pet/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/firebase/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "general_configs.env");
  await Firebase.initializeApp(
    name: 'chatbox',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
