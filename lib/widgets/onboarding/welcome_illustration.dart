import 'package:flutter/material.dart';

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B87BD), Color(0xFF235B80)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -46,
            right: -20,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -68,
            left: -36,
            child: Container(
              width: 230,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(140),
              ),
            ),
          ),
          const Positioned(
            top: 22,
            left: 20,
            child: Icon(Icons.auto_awesome_rounded, color: Colors.white70),
          ),
          const Positioned(
            top: 40,
            right: 44,
            child: Icon(Icons.square_rounded, color: Colors.white70, size: 12),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _AvatarCard(
                        icon: Icons.engineering_rounded,
                        color: const Color(0xFFE8F4FF),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 112,
                        height: 78,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.dashboard_customize_rounded,
                          color: Color(0xFF235B80),
                          size: 36,
                        ),
                      ),
                      const SizedBox(width: 12),
                      _AvatarCard(
                        icon: Icons.support_agent_rounded,
                        color: const Color(0xFFFFF3E3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: 120,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarCard extends StatelessWidget {
  const _AvatarCard({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon, color: const Color(0xFF235B80), size: 28),
    );
  }
}
