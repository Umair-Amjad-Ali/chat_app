import 'package:chat_app/constants/app_colors.dart';
import 'package:chat_app/views/widgets/custom_input_field.dart';
import 'package:chat_app/views/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth_controller.dart';
import '../widgets/custom_button.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            "Sign In",
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
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          controller.isRememberMeChecked.value,
                                      onChanged: (value) {
                                        controller.isRememberMeChecked.value =
                                            value!;
                                      },
                                      side: const BorderSide(
                                        color: AppColors.primaryBlue,
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
                                    Get.toNamed("/forgotPasswordScreen");
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.032,
                                      color: AppColors.primaryBlue,
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
                              text: "Sign In",
                              onPressed: controller.validateSignUpForm,
                            ),
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
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.2),
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
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed("");
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
            ),
          ),
        ),
      ),
    );
  }
}
