import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/model/auth_data.dart';
import 'package:my_project/screens/home/home_screen.dart';

class LoginController extends GetxController {
  // Observables for state management
  var isLoading = false.obs;
  var obscurePassword = true.obs;

  // Controllers for Input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser() async {
    // 1. Basic Validation
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showError("Required", "Please enter both email and password");
      return;
    }

    try {
      isLoading.value = true;

      // 2. Authenticate with Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // 3. Retrieve user-specific data (Username/Phone) from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        // 4. Map to Model
        final userData = AuthData(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          username: userDoc.get('username') ?? "User",
          phone: userDoc.get('phone') ?? "",
        );

        // 5. Success: Navigate to Home
        Get.offAll(() => const HomeScreen(), arguments: userData);
      } else {
        _showError("Data Error", "User profile not found in database.");
      }
    } on FirebaseAuthException catch (e) {
      _showError("Login Failed", e.message ?? "Invalid credentials");
    } finally {
      isLoading.value = false;
    }
  }

  void _showError(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}