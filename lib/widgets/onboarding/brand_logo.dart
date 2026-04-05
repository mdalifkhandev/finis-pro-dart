import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 92});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFDDEAF4), Color(0xFFF8FBFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: const Color(0xFF8AA8BD), width: 1.5),
            ),
          ),
          Icon(
            Icons.apartment_rounded,
            size: size * 0.42,
            color: const Color(0xFF5C7C95),
          ),
          Positioned(
            bottom: size * 0.12,
            right: size * 0.18,
            child: Container(
              width: size * 0.34,
              height: size * 0.34,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF5C7C95), width: 1.5),
              ),
              child: Icon(
                Icons.home_work_outlined,
                size: size * 0.18,
                color: const Color(0xFF5C7C95),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
