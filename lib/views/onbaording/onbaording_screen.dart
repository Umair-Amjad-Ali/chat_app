import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_app/views/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08,
            vertical: screenHeight * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/pngs/onbaording.png",
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.3,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Connect, Chat, and Belong",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Engage in real-time conversations with people from your city or state.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: "Get Started",
                      onPressed: () {
                        Get.toNamed("/signUpScreen");
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
