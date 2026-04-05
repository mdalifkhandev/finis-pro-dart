import 'package:flutter/material.dart';

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 210,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F8EC5), Color(0xFF2E6F9D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            left: -40,
            right: -24,
            bottom: -80,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFF255D84).withValues(alpha: 0.88),
                borderRadius: BorderRadius.circular(180),
              ),
            ),
          ),
          Positioned(
            left: -60,
            right: -80,
            bottom: -124,
            child: Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(220),
              ),
            ),
          ),
          const Positioned(
            top: 28,
            left: 24,
            right: 24,
            child: _TeamIllustration(),
          ),
        ],
      ),
    );
  }
}

class _TeamIllustration extends StatelessWidget {
  const _TeamIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Positioned(
            left: 70,
            top: 6,
            child: Container(
              width: 122,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFD4E3EE)),
              ),
              child: const Icon(
                Icons.public_rounded,
                size: 34,
                color: Color(0xFFB5C9D8),
              ),
            ),
          ),
          Positioned(
            left: 54,
            top: 86,
            child: Container(
              width: 156,
              height: 5,
              color: const Color(0xFF7A4C35),
            ),
          ),
          const Positioned(
            left: 4,
            top: 24,
            child: _StandingPerson(
              shirtColor: Color(0xFF1E4564),
              pantsColor: Color(0xFF314760),
            ),
          ),
          const Positioned(
            left: 98,
            top: 50,
            child: _SittingPerson(
              shirtColor: Color(0xFFFFFFFF),
              accentColor: Color(0xFF1D3042),
              chairColor: Color(0xFF58687B),
            ),
          ),
          const Positioned(
            right: 8,
            top: 50,
            child: _SittingPerson(
              shirtColor: Color(0xFF203C56),
              accentColor: Color(0xFFF0A98F),
              chairColor: Color(0xFF58687B),
            ),
          ),
          Positioned(
            left: 28,
            top: 88,
            child: Column(
              children: [
                Container(width: 8, height: 24, color: const Color(0xFF35566F)),
                const Icon(
                  Icons.energy_savings_leaf_outlined,
                  color: Color(0xFFE5F3FE),
                  size: 28,
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 20,
            child: Column(
              children: List.generate(
                2,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFFD4E3EE)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StandingPerson extends StatelessWidget {
  const _StandingPerson({required this.shirtColor, required this.pantsColor});

  final Color shirtColor;
  final Color pantsColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 76,
      child: Stack(
        children: [
          const Positioned(
            left: 15,
            top: 0,
            child: CircleAvatar(radius: 8, backgroundColor: Color(0xFFCD8B6C)),
          ),
          Positioned(
            left: 10,
            top: 14,
            child: Container(
              width: 20,
              height: 28,
              decoration: BoxDecoration(
                color: shirtColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 13,
            top: 40,
            child: Container(width: 7, height: 28, color: pantsColor),
          ),
          Positioned(
            left: 23,
            top: 40,
            child: Container(width: 7, height: 28, color: pantsColor),
          ),
          Positioned(
            left: 3,
            top: 23,
            child: Transform.rotate(
              angle: 0.15,
              child: Container(width: 14, height: 5, color: shirtColor),
            ),
          ),
          Positioned(
            right: 0,
            top: 24,
            child: Transform.rotate(
              angle: -0.7,
              child: Container(width: 16, height: 5, color: shirtColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _SittingPerson extends StatelessWidget {
  const _SittingPerson({
    required this.shirtColor,
    required this.accentColor,
    required this.chairColor,
  });

  final Color shirtColor;
  final Color accentColor;
  final Color chairColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62,
      height: 72,
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 0,
            child: CircleAvatar(radius: 8, backgroundColor: accentColor),
          ),
          Positioned(
            left: 14,
            top: 12,
            child: Container(
              width: 22,
              height: 20,
              decoration: BoxDecoration(
                color: shirtColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 30,
            child: Transform.rotate(
              angle: 0.35,
              child: Container(
                width: 28,
                height: 6,
                color: const Color(0xFF2B4059),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 18,
            child: Container(
              width: 18,
              height: 26,
              decoration: BoxDecoration(
                color: chairColor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Positioned(
            left: 4,
            top: 42,
            child: Container(width: 4, height: 22, color: chairColor),
          ),
          Positioned(
            left: 12,
            top: 42,
            child: Container(width: 4, height: 22, color: chairColor),
          ),
        ],
      ),
    );
  }
}
