import 'package:flutter/material.dart';

import 'checklist_row.dart';
import 'metric_card.dart';

class PreviewPanel extends StatelessWidget {
  const PreviewPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF14B8A6), Color(0xFFF59E0B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.flutter_dash_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Screen',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Simple, responsive, and ready to extend.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.72),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Row(
            children: [
              Expanded(
                child: MetricCard(value: '6', label: 'Platforms'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: MetricCard(value: '1', label: 'Starter screen'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const MetricCard(
            value: '100%',
            label: 'Ready for your next feature',
            fullWidth: true,
          ),
          const SizedBox(height: 28),
          Text(
            'Next steps',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          const ChecklistRow(text: 'Connect your API or local data layer.'),
          const ChecklistRow(text: 'Add navigation and additional screens.'),
          const ChecklistRow(
            text: 'Replace placeholder buttons with real actions.',
          ),
        ],
      ),
    );
  }
}
