import 'package:flutter/material.dart';

class OnboardingTextField extends StatelessWidget {
  const OnboardingTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon, color: const Color(0xFF9AA5B3), size: 20),
      ),
    );
  }
}
