import "package:chat_app/views/widgets/custom_button.dart";
import "package:flutter/material.dart";

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08, // 8% of screen width
            vertical: screenHeight * 0.05, // 5% of screen height
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image with responsive size
                Image.asset(
                  "assets/pngs/onbaording.png",
                  width: screenWidth * 0.6, // 60% of screen width
                  height: screenHeight * 0.3, // 30% of screen height
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03), // 3% of screen height

                // Main Heading
                Text(
                  "Connect, Chat, and Belong",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // 6% of screen width
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),

                // Subtext
                Text(
                  "Engage in real-time conversations with people from your city or state.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // 4% of screen width
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Custom Button
                SizedBox(
                  width: double.infinity, // 70% of screen width
                  child: const CustomButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
