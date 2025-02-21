import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final bool isPasswordVisibility;
  final VoidCallback? toggleVisibility;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.isPasswordVisibility = false,
    this.toggleVisibility,
    required this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<String>(
          validator: validator,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller,
                  obscureText: isPassword ? isPasswordVisibility : false,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: screenWidth * 0.045,
                  ),
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04, right: screenWidth * 0.02),
                      child: Icon(icon,
                          color: const Color(0xFF888888),
                          size: screenWidth * 0.06),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: const Color(0xFF888888),
                      fontSize: screenWidth * 0.045,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.05,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 250, 249, 249),
                          width: 1.2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: const BorderSide(
                          color: Color(0xFF4A3AFF), width: 1.2),
                    ),
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(
                              isPasswordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFF888888),
                              size: screenWidth * 0.06,
                            ),
                            onPressed: toggleVisibility,
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    state.didChange(value);
                  },
                ),
                if (state.hasError)
                  Padding(
                    padding:
                        EdgeInsets.only(top: screenHeight * 0.005, left: 5),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
