import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/screens/authentication/login_screen.dart';
import '../auth_controller/signup_controller.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: const Color(0xFF1D1D27),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildHeader(),
            const SizedBox(height: 30),

            _CustomField(
              label: "Full Name",
              hint: "Hong Saoleang",
              con: controller.usernameController,
            ),
            const SizedBox(height: 15),
            _CustomField(
              label: "Email",
              hint: "email@example.com",
              con: controller.emailController,
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            _CustomField(
              label: "Phone",
              hint: "012 345 678",
              con: controller.phoneController,
              type: TextInputType.phone,
            ),
            const SizedBox(height: 15),

            // Password Field with Toggle
            Obx(
              () => _CustomField(
                label: "Password",
                hint: "••••••••",
                con: controller.passwordController,
                isPassword: controller.obscurePassword.value,
                suffix: IconButton(
                  icon: Icon(
                    controller.obscurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () => controller.obscurePassword.toggle(),
                ),
              ),
            ),

            const SizedBox(height: 15),
            _buildAgreement(controller),
            const SizedBox(height: 30),

            // Submit Button
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () => controller.signUpUser(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),

            _buildLoginLink(),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  AppBar _buildAppBar(BuildContext context) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
      onPressed: () => Get.back(),
    ),
    title: const Text("Sign Up", style: TextStyle(color: Colors.white)),
    centerTitle: true,
  );

  Widget _buildHeader() => const Column(
    children: [
      Text(
        "Let's get started",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        "The latest movies and series\nare here",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    ],
  );

  Widget _buildAgreement(SignUpController controller) => Row(
    children: [
      Obx(
        () => Checkbox(
          value: controller.isAgreed.value,
          activeColor: Colors.cyanAccent,
          onChanged: (val) => controller.isAgreed.value = val!,
        ),
      ),
      const Expanded(
        child: Text(
          "I agree to the Terms and Privacy Policy",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    ],
  );

  Widget _buildLoginLink() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have an account? ",
        style: TextStyle(color: Colors.grey),
      ),
      TextButton(
        onPressed: () => Get.to(() => const LoginScreen()),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

// --- Reusable Text Field Component ---
class _CustomField extends StatelessWidget {
  final String label, hint;
  final TextEditingController con;
  final bool isPassword;
  final Widget? suffix;
  final TextInputType type;

  const _CustomField({
    required this.label,
    required this.hint,
    required this.con,
    this.isPassword = false,
    this.suffix,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: con,
          obscureText: isPassword,
          keyboardType: type,
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
