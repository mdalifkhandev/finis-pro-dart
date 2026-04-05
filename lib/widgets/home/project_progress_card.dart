import 'package:flutter/material.dart';

class ProjectProgressCard extends StatelessWidget {
  const ProjectProgressCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.workers,
    required this.progressText,
    required this.progressValue,
  });

  final String title;
  final String status;
  final Color statusColor;
  final String workers;
  final String progressText;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF183B56).withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: statusColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.groups_2_outlined,
                size: 15,
                color: Color(0xFF7B8794),
              ),
              const SizedBox(width: 4),
              Text(
                workers,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF7B8794),
                ),
              ),
              const Spacer(),
              Text(
                progressText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF6A7280),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 6,
              color: const Color(0xFF2A5977),
              backgroundColor: const Color(0xFFE2E8F0),
            ),
          ),
        ],
      ),
    );
  }
}
