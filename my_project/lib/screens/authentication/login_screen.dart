import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFF1D1D27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        ),
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildHeader(),
            const SizedBox(height: 40),

            // EMAIL FIELD
            _CustomInputField(
              label: "Email Address",
              hint: "yourname@gmail.com",
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // PASSWORD FIELD
            Obx(() => _CustomInputField(
              label: "Password",
              hint: "••••••••",
              isPassword: controller.obscurePassword.value,
              controller: controller.passwordController,
              suffix: IconButton(
                icon: Icon(
                  controller.obscurePassword.value 
                      ? Icons.visibility_off_outlined 
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: () => controller.obscurePassword.toggle(),
              ),
            )),

            _buildForgotPassword(),
            const SizedBox(height: 30),

            // LOGIN BUTTON
            Obx(() => SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: controller.isLoading.value ? null : () => controller.loginUser(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E5FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20, width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => const Column(
    children: [
      Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Text("Please enter your details\nto continue.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 16)),
    ],
  );

  Widget _buildForgotPassword() => Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {}, // Add forgot password logic here later
      child: const Text("Forgot Password?", style: TextStyle(color: Colors.cyanAccent)),
    ),
  );
}

// Reusable Input Component for a "Power Structure"
class _CustomInputField extends StatelessWidget {
  final String label, hint;
  final bool isPassword;
  final Widget? suffix;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const _CustomInputField({
    required this.label, required this.hint, required this.controller,
    this.isPassword = false, this.suffix, this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            suffixIcon: suffix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.cyanAccent),
            ),
          ),
        ),
      ],
    );
  }
}