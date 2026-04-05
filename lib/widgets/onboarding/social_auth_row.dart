import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: Color(0xFFE1E7EF))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF7C8897),
                ),
              ),
            ),
            const Expanded(child: Divider(color: Color(0xFFE1E7EF))),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialCircle(label: 'G', color: Color(0xFFEA4335)),
            SizedBox(width: 12),
            _SocialCircle(label: 'A', color: Color(0xFF111111)),
            SizedBox(width: 12),
            _SocialCircle(label: 'f', color: Color(0xFF1877F2)),
          ],
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  const _SocialCircle({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFD7DEE7)),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
