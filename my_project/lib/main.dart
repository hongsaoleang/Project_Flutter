import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/screens/authentication/choice.dart';

import 'firebase_options.dart';
// Use the full package path to ensure the compiler finds it

void main() async {
  // 1. Ensures Flutter framework is ready
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase using the class from firebase_options.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyWidget());
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Ordering App",
      home: const Choice(),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, 
        primaryColor: const Color(0xFF00E5FF),
      ),
    );
  }
}