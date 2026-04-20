import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Positioned(
            top: 100,
            left: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.deepPurpleAccent.withValues(alpha: 1),
                    Colors.deepPurpleAccent.withValues(alpha: 0.5),
                    Colors.deepPurpleAccent.withValues(alpha: 0.0),
                    Colors.deepPurpleAccent.withValues(alpha: -0.1),

                    // Colors.deepPurpleAccent.withValues(alpha: 0.3),
                    // Colors.deepPurpleAccent.withValues(alpha: 0.3),
                    // Colors.deepPurpleAccent.withValues(alpha: 0.6),
                  ],
                ),
                // shape: BoxShape.circle
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 25,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.deepOrange.withValues(alpha: 0.3),
                    Colors.deepOrange.withValues(alpha: 0.9),
                    Colors.deepOrange.withValues(alpha: 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned.fill(
            top: 300,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.amber.withValues(alpha: 0.3),
                    Colors.amber.withValues(alpha: 0.9),
                    Colors.amber.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
