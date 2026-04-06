import 'package:flutter/material.dart';

class AssignedProjectCard extends StatelessWidget {
  const AssignedProjectCard({
    super.key,
    required this.priority,
    required this.priorityColor,
    required this.extraCount,
    this.onTap,
  });

  final String priority;
  final Color priorityColor;
  final String extraCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE6EDF3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: priorityColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      priority,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: priorityColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.apartment_rounded,
                    size: 24,
                    color: Color(0xFF224E6D),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Electrical rough-in',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF222222),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Riverside Tower',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF8A939D),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Sept 18, 2024',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.check_box_outline_blank_rounded,
                    size: 18,
                    color: Color(0xFF4C8DFF),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '0/3',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF8A939D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const AssignedProjectAvatarStack(),
                  const SizedBox(width: 8),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xFF19E56D),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        extraCount,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF111111),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color: Color(0xFF222222),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '2',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF555555),
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

class AssignedProjectAvatarStack extends StatelessWidget {
  const AssignedProjectAvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [Color(0xFFE8C39E), Color(0xFF8AC0D3), Color(0xFFD9A5A5)];

    return SizedBox(
      width: 64,
      height: 34,
      child: Stack(
        children: [
          for (var i = 0; i < colors.length; i++)
            Positioned(
              left: i * 16,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: colors[i],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  size: 18,
                  color: Color(0xFF3F3F3F),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
