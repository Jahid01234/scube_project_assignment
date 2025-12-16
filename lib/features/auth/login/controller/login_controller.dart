import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onForgotPasswordTap() {
    Get.snackbar(
      "Forgot Password",
      "Password reset link will be sent to your registered email",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.shade400,
      colorText: Colors.white,
      icon: const Icon(Icons.info_outline, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  void onRegisterNowTap() {
    Get.snackbar(
      "Registration",
      "Registration feature coming soon! Please contact admin for account creation.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.shade400,
      colorText: Colors.white,
      icon: const Icon(Icons.app_registration, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }


  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
