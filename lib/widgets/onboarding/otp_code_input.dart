import 'package:flutter/material.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({super.key, this.length = 5});

  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          width: 44,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F9FC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD7DEE7)),
          ),
        ),
      ),
    );
  }
}
