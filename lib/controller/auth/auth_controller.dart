import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  // Reactive observables
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isTermsAccepted = false.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  get toggledPasswordVisibility => null;

  get toggledConfirmPasswordVisibility => null;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate and submit the signup form
  void validateSignUpForm() {
    if (!isTermsAccepted.value) {
      Get.snackbar(
        "Terms & Conditions",
        "You must accept the terms and conditions",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Account Created Successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed("/loginScreen"); // Navigate to login screen
      });
    }
  }

  @override
  void onClose() {
    // Dispose controllers to free memory
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
