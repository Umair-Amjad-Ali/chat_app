import 'package:chat_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignupSucess extends StatelessWidget {
  const SignupSucess({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A3AFF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: screenWidth * 0.1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Account created successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "We're thrilled to have you here. Explore the new era of messaging.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(text: "Get Started", onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
