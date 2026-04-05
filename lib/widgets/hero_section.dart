import 'package:flutter/material.dart';

import 'feature_pill.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.theme, required this.isWide});

  final ThemeData theme;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.flash_on_rounded, size: 18, color: Color(0xFFF59E0B)),
              SizedBox(width: 8),
              Text('Fresh Flutter starter'),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'Build your app with a clean welcome experience.',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Flater is configured with the full Flutter project structure and a polished first screen so you can start building features immediately.',
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.78),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FeaturePill(
              icon: Icons.phone_android_rounded,
              label: 'Android ready',
            ),
            FeaturePill(icon: Icons.language_rounded, label: 'Web included'),
            FeaturePill(
              icon: Icons.desktop_windows_rounded,
              label: 'Desktop support',
            ),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Building'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF14B8A6),
                foregroundColor: const Color(0xFF041317),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.design_services_rounded),
              label: const Text('Explore UI'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(top: isWide ? 32 : 24),
          child: Text(
            'Designed for a strong first impression on mobile and desktop.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.62),
            ),
          ),
        ),
      ],
    );
  }
}
