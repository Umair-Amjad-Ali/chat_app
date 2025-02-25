import 'package:chat_app/constants/app_colors.dart';
import 'package:chat_app/controller/auth/auth_controller.dart';
import 'package:chat_app/views/widgets/custom_button.dart';
import 'package:chat_app/views/widgets/custom_input_field.dart';
import 'package:chat_app/views/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                  .onDrag, // Dismiss keyboard on scroll
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.03),

                      // Logo

                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "Enter your email below to continue",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInputField(
                              hintText: "Full Name",
                              controller: controller.nameController,
                              icon: Icons.person,
                              keyboardType: TextInputType.text,
                              validator: controller.validateName,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomInputField(
                              hintText: "Email",
                              controller: controller.emailController,
                              icon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              validator: controller.validateEmail,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Obx(
                              () => CustomInputField(
                                hintText: "Password",
                                controller: controller.passwordController,
                                icon: Icons.lock,
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                                isPasswordVisibility:
                                    controller.isPasswordVisible.value,
                                toggleVisibility:
                                    controller.togglePasswordVisibility,
                                validator: controller.validatePassword,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Obx(
                              () => CustomInputField(
                                hintText: "Confirm Password",
                                controller:
                                    controller.confirmPasswordController,
                                icon: Icons.lock,
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                                isPasswordVisibility:
                                    controller.isConfirmPasswordVisible.value,
                                toggleVisibility:
                                    controller.toggleConfirmPasswordVisibility,
                                validator: controller.validateConfirmPassword,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Obx(
                        () => Row(
                          children: [
                            Checkbox(
                              value: controller.isTermsAccepted.value,
                              onChanged: (value) {
                                controller.isTermsAccepted.value = value!;
                              },
                              activeColor: AppColors.primaryBlue,
                              checkColor: AppColors.white,
                              side: const BorderSide(
                                color: AppColors.primaryBlue,
                                width: 2,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.032,
                                    color: AppColors.black,
                                  ),
                                  children: [
                                    const TextSpan(
                                        text: "By checking, you agree to the "),
                                    TextSpan(
                                      text: "Terms and conditions",
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                        text: " of the service provider."),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                            text: "Sign Up",
                            onPressed: controller.validateSignUpForm),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Or Sign up with"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                              assetPath: "assets/pngs/google.png",
                              onTap: () {
                                print("Google SignUp Clicked");
                              }),
                          SizedBox(width: screenWidth * 0.12),
                          SocialButton(
                              assetPath: "assets/pngs/apple-logo.png",
                              onTap: () {
                                print("Apple SignUp Clicked");
                              })
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.09),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: screenWidth * 0.032,
                              color: AppColors.black,
                            ),
                            children: [
                              const TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Sign In",
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed("/signInScreen");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
