import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
                child: Image.asset("assets/images/cinema_logo.png"),
            ),
          ), 
          Center(
            child: Text("CINEMA", style: TextStyle(fontSize: 28),),
          ), 
          Center(
            child: Text("Enter Your Registered "),
          ),
          Center(
            child: Text("Phone Number To Sign Up"),
          ), 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightBlue, 
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white),)),
            ),
          )

        ],
      ),
    );
  }
}