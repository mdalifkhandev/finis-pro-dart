import 'package:flutter/material.dart';

class WorkerSiteCard extends StatelessWidget {
  const WorkerSiteCard({
    super.key,
    required this.name,
    required this.role,
    required this.site,
    required this.status,
  });

  final String name;
  final String role;
  final String site;
  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
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
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFB4C7D8), Color(0xFFEDF4FA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.person, color: Color(0xFF2A5977)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7B8794),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: Color(0xFF6A7280),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      site,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6A7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF7EE),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF67A66A),
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
