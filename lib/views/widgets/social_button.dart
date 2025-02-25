import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;

  final VoidCallback? onTap; // Function for tap action

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.onTap, // Required onTap function
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap, // Executes function when tapped
      child: Image.asset(
        assetPath,
        width: screenWidth * 0.07,
        height: screenHeight * 0.04,
      ),
    );
  }
}
