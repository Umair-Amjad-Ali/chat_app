import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed ?? () {}, // Default empty function if not provided
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03, // 3.5% of screen width
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Get Started",
        style: TextStyle(
          fontSize: screenWidth * 0.045, // 4.5% of screen width
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
