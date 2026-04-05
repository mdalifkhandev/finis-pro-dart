import 'package:flutter/material.dart';

class OtpCodeInput extends StatelessWidget {
  const OtpCodeInput({super.key, this.length = 6, this.activeIndex = 0});

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: index == activeIndex
                  ? const Color(0xFF2C2C2C)
                  : const Color(0xFFB7C1CB),
            ),
          ),
          child: index == activeIndex
              ? const Center(
                  child: Text(
                    '|',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
