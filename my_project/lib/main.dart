import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_project/screens/authentication/choice.dart';
import 'package:my_project/screens/download/download_page.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Choice(),
      theme: ThemeData(),
      darkTheme: ThemeData(),
      color: Colors.amber,
    );
  }
}
