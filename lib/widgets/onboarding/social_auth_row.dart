import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({
    super.key,
    required this.label,
    this.topSpacing = 12,
    this.iconSize = 34,
  });

  final String label;
  final double topSpacing;
  final double iconSize;

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
        SizedBox(height: topSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialCircle(
              label: 'G',
              color: const Color(0xFFEA4335),
              size: iconSize,
            ),
            const SizedBox(width: 14),
            _SocialCircle(
              label: 'A',
              color: const Color(0xFF111111),
              size: iconSize,
            ),
            const SizedBox(width: 14),
            _SocialCircle(
              label: 'f',
              color: const Color(0xFF1877F2),
              size: iconSize,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  const _SocialCircle({
    required this.label,
    required this.color,
    required this.size,
  });

  final String label;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
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
            fontSize: size * 0.42,
          ),
        ),
      ),
    );
  }
}
