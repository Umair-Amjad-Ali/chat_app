import 'package:chat_app/constants/app_colors.dart';
import 'package:chat_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmailSucess extends StatelessWidget {
  const EmailSucess({super.key});

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
                    color: AppColors.primaryBlue,
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
                  "Email sent successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.008),
                Text(
                  "Check your email inbox to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(text: "Back to login", onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
