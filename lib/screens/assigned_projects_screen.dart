import 'package:flutter/material.dart';

import 'create_project_screen.dart';
import 'project_details_screen.dart';

class AssignedProjectsScreen extends StatelessWidget {
  const AssignedProjectsScreen({super.key});

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
                      'Assigned Projects',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _AssignedProjectCard(
                      priority: 'MEDIUM',
                      priorityColor: Color(0xFFFFB800),
                      extraCount: '3+',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const ProjectDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    _AssignedProjectCard(
                      priority: 'HIGH',
                      priorityColor: Color(0xFFFF5A5A),
                      extraCount: '10+',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const ProjectDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    _AssignedProjectCard(
                      priority: 'LOW',
                      priorityColor: Color(0xFF2ECC71),
                      extraCount: '10+',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const ProjectDetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const CreateProjectScreen(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFF2A5977),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Create Project & Setup Floors'),
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

class _AssignedProjectCard extends StatelessWidget {
  const _AssignedProjectCard({
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
                  const _AvatarStack(),
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

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

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
