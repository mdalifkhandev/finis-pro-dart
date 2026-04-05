import 'package:flutter/material.dart';

class ProjectBudgetDetailsScreen extends StatelessWidget {
  const ProjectBudgetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              SizedBox(
                height: 36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    Text(
                      'Project Details',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    children: const [
                      _BudgetCard(
                        label: 'Total Budget',
                        value: '\$2,500,000',
                        valueColor: Color(0xFF174E99),
                      ),
                      SizedBox(height: 10),
                      _SpentCard(),
                      SizedBox(height: 10),
                      _BudgetCard(
                        label: 'Remaining',
                        value: '\$625,000',
                        valueColor: Color(0xFF19B652),
                      ),
                      SizedBox(height: 10),
                      _ProjectClientCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  const _BudgetCard({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EDF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF9BA3AD),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 31,
              color: valueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpentCard extends StatelessWidget {
  const _SpentCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EDF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spent',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF9BA3AD),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$1,875,000',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontSize: 31,
              color: const Color(0xFFFF5A1F),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: 0.75,
              minHeight: 4,
              backgroundColor: const Color(0xFFE4E8ED),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFFF5A1F),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '75.0% of budget used',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF9BA3AD),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectClientCard extends StatelessWidget {
  const _ProjectClientCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EDF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project details',
            style: theme.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Description',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF9BA3AD),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "We partner with industry-leading print providers to ensure your creations come to life with exceptional quality",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF636D78),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Client Info',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF9BA3AD),
            ),
          ),
          const SizedBox(height: 8),
          const _InfoRow(label: 'Name', value: 'Kristin Watson'),
          const _InfoRow(label: 'Company', value: 'Xing'),
          const _InfoRow(label: 'Connection', value: 'Private', accent: true),
          const _InfoRow(label: 'Email', value: 'kristinwatson@gmail.com'),
          const _InfoRow(label: 'Phone number', value: '(303) 555-0105'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.accent = false,
  });

  final String label;
  final String value;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 82,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF9BA3AD),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (accent)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.stars_rounded,
                      size: 12,
                      color: Color(0xFFE2BA2E),
                    ),
                  ),
                Flexible(
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: accent
                          ? const Color(0xFF7C63FF)
                          : const Color(0xFF222222),
                      fontWeight: accent ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
