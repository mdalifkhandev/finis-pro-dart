import 'package:flutter/material.dart';

class ProjectBudgetCard extends StatelessWidget {
  const ProjectBudgetCard({
    super.key,
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

class ProjectSpentCard extends StatelessWidget {
  const ProjectSpentCard({super.key});

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
            child: const LinearProgressIndicator(
              value: 0.75,
              minHeight: 4,
              backgroundColor: Color(0xFFE4E8ED),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5A1F)),
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

class ProjectClientCard extends StatelessWidget {
  const ProjectClientCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: const [
          _ProjectClientHeader(),
          SizedBox(height: 12),
          ProjectBudgetInfoRow(label: 'Name', value: 'Kristin Watson'),
          ProjectBudgetInfoRow(label: 'Company', value: 'Xing'),
          ProjectBudgetInfoRow(
            label: 'Connection',
            value: 'Private',
            accent: true,
          ),
          ProjectBudgetInfoRow(
            label: 'Email',
            value: 'kristinwatson@gmail.com',
          ),
          ProjectBudgetInfoRow(label: 'Phone number', value: '(303) 555-0105'),
        ],
      ),
    );
  }
}

class _ProjectClientHeader extends StatelessWidget {
  const _ProjectClientHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
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
          'We partner with industry-leading print providers to ensure your creations come to life with exceptional quality',
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
      ],
    );
  }
}

class ProjectBudgetInfoRow extends StatelessWidget {
  const ProjectBudgetInfoRow({
    super.key,
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
