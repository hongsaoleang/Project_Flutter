import 'package:flutter/material.dart';
import 'package:my_project/screens/authentication/login_screen.dart';
import 'package:my_project/screens/authentication/sign_up.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F2C), // dark background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset("assets/images/cinema_logo.png", height: 100),
            const SizedBox(height: 20),

            // Title
            const Text(
              "CINEMAX",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),
            // Subtitle
            const Text(
              "Enter your registered",
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              "Phone Number to Sign Up",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Login Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I already have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Divider with text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or Sign up with",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socialButton("assets/images/google_icons.png"),
                const SizedBox(width: 20),
                socialButton("assets/images/apple_icons.png"),
                const SizedBox(width: 20),
                socialButton("assets/images/fb_icons.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget socialButton(String path) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F3A),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(path),
      ),
    );
  }
}
