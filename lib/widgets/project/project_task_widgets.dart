import 'package:flutter/material.dart';

class ProjectTaskFilterChip extends StatelessWidget {
  const ProjectTaskFilterChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF245778) : const Color(0xFFF1F8FA),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xFF245778) : const Color(0xFFD7E6EA),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF43505A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectTaskCard extends StatelessWidget {
  const ProjectTaskCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.statusBackground,
    this.onTap,
  });

  final String status;
  final Color statusColor;
  final Color statusBackground;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE7EDF3)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0C0B2239),
                blurRadius: 14,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 20,
                    color: Color(0xFF3C78FF),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Install electrical wiring - Floor 2',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Riverside Tower',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF5E6873),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Jan 15',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5E6873),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Mike Johnson',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF5E6873),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Jan 18',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5E6873),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusBackground,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      status,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Update Status',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF245778),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
