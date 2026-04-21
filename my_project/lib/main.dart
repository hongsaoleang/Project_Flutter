import 'package:flutter/material.dart';
import 'package:my_project/screens/home/home_screen.dart';
import 'package:my_project/screens/login_screen.dart';
import 'package:my_project/screens/sign_up.dart';

void main(){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(),
      darkTheme: ThemeData(),
      color: Colors.amber,
      
    );
  }
}