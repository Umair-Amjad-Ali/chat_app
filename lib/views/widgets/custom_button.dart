import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed ?? () {}, // Default empty function if not provided
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4A3AFF),
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.045, // 3.5% of screen width
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.045, // 4.5% of screen width
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
