import 'package:flutter/material.dart';

class OnboardingCardScaffold extends StatelessWidget {
  const OnboardingCardScaffold({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.title,
    required this.children,
    this.subtitle,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF285A78).withValues(alpha: 0.14),
            blurRadius: 44,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (onBack != null)
                  IconButton(
                    onPressed: onBack,
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    visualDensity: VisualDensity.compact,
                  )
                else
                  const SizedBox(width: 36),
                const Spacer(),
                Text(
                  'Step $step of $totalSteps',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: const Color(0xFF6D7886),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: step / totalSteps,
                minHeight: 6,
                backgroundColor: const Color(0xFFE5EBF2),
                color: const Color(0xFF285A78),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF203042),
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6D7886),
                  height: 1.45,
                ),
              ),
            ],
            const SizedBox(height: 22),
            ...children,
          ],
        ),
      ),
    );
  }
}
