import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final VoidCallback? onTap; // Function for tap action

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.width,
    required this.height,
    required this.onTap, // Required onTap function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Executes function when tapped
      child: SvgPicture.asset(
        assetPath,
        width: width, // Responsive width
        height: height, // Responsive height
      ),
    );
  }
}
