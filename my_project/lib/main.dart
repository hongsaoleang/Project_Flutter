import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_project/screens/detail/detail_page.dart';
import 'package:my_project/screens/home/home_screen.dart';
import 'package:my_project/screens/login_screen.dart';
import 'package:my_project/screens/search/search_page.dart';
import 'package:my_project/screens/sign_up.dart';

void main(){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetailScreen(),
      theme: ThemeData(),
      darkTheme: ThemeData(),
      color: Colors.amber,
      
    );
  }
}