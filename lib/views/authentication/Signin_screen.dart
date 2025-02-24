import 'package:chat_app/views/widgets/custom_input_field.dart';
import 'package:chat_app/views/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth_controller.dart';
import '../widgets/custom_button.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Main Heading
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.normal,
                ),
              ),

              // Subtext
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Enter your email below to continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Input Fields
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInputField(
                      hintText: "Email",
                      controller: controller.emailController,
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
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
                        toggleVisibility: controller.toggledPasswordVisibility,
                        validator: (value) {
                          if (!GetUtils.isLengthBetween(value!, 6, 20)) {
                            return "Password must be 6-20 characters long";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Row with "Remember me" checkbox and "Forgot Password" text
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isRememberMeChecked.value,
                          onChanged: (value) {
                            controller.isRememberMeChecked.value = value!;
                          },
                          side: const BorderSide(
                            color: Color(0xFF4A3AFF),
                            width: 2,
                          ),
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: screenWidth * 0.032,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Forgot Password screen
                        Get.toNamed("/forgotPasswordScreen");
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          color: Color(0xFF4A3AFF),
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Sign In",
                  onPressed: controller.validateSignUpForm,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // OR Divider
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

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    assetPath: "assets/svgs/google.svg",
                    width: screenWidth * 0.08,
                    height: screenHeight * 0.08,
                    onTap: () {
                      print("Google SignUp Clicked");
                    },
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SocialButton(
                    assetPath: "assets/svgs/apple.svg",
                    width: screenWidth * 0.035,
                    height: screenHeight * 0.035,
                    onTap: () {
                      print("Apple SignUp Clicked");
                    },
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: screenWidth * 0.032,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF4A3AFF),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/signUpScreen");
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
  }
}
