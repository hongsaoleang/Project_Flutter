import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/screens/authentication/login_screen.dart';

class SignUpController extends GetxController {
  // Observables for state management
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var isAgreed = false.obs;

  // Controllers for Input
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUpUser() async {
    // 1. Logic Validations
    if (!isAgreed.value) {
      _showError(
        "Notice",
        "Please agree to the Terms and Services",
        Colors.orangeAccent,
      );
      return;
    }

    if (_isAnyFieldEmpty()) {
      _showError("Error", "All fields are required", Colors.redAccent);
      return;
    }

    try {
      isLoading.value = true;

      // 2. Authentication: Create User
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      // 3. Database: Save to Firestore
      await FirebaseFirestore.instance
          .collection('users') // Changed 'auth' to 'users' (standard practice)
          .doc(userCredential.user!.uid)
          .set({
            'username': usernameController.text.trim(),
            'email': emailController.text.trim(),
            'phone': phoneController.text.trim(),
            'uid': userCredential.user!.uid,
            'createdAt':
                FieldValue.serverTimestamp(), // Better than DateTime.now() for DBs
          });

      Get.offAll(() =>  LoginScreen() , arguments: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      _showError("Auth Error", e.message ?? "Sign up failed", Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  bool _isAnyFieldEmpty() {
    return emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty;
  }

  void _showError(String title, String msg, Color color) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
