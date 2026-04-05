import 'package:flutter/material.dart';

import 'create_project_screen.dart';
import 'floor_room_setup_screen.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

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
                      'Projects details',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF245778),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -30,
                              top: 4,
                              child: Container(
                                width: 132,
                                height: 132,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    width: 8,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 18,
                              top: -20,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.10),
                                    width: 8,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -24,
                              bottom: -12,
                              child: Container(
                                width: 148,
                                height: 148,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    width: 8,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF2D8B7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        size: 42,
                                        color: Color(0xFF75553A),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Riverside Tower',
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '@maya.louis',
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                  color: const Color(
                                                    0xFFB9D4E3,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.fromLTRB(
                                    14,
                                    14,
                                    14,
                                    14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.24),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Column(
                                    children: [
                                      _ProjectInfoRow(
                                        icon: Icons.location_on_outlined,
                                        label:
                                            '123 Construction Blvd, Toronto, ON',
                                      ),
                                      SizedBox(height: 12),
                                      _ProjectInfoRow(
                                        icon: Icons.business_outlined,
                                        label: 'Horizon Builders Inc.',
                                      ),
                                      SizedBox(height: 12),
                                      _ProjectInfoRow(
                                        icon: Icons.public_rounded,
                                        label: '2025-08-01 - Ongoing',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FilledButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  const FloorRoomSetupScreen(),
                                            ),
                                          );
                                        },
                                        style: FilledButton.styleFrom(
                                          minimumSize: const Size.fromHeight(
                                            42,
                                          ),
                                          backgroundColor: const Color(
                                            0xFFC4E7FF,
                                          ),
                                          foregroundColor: const Color(
                                            0xFF173D56,
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Text('Floor plan'),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: FilledButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  const CreateProjectScreen(
                                                    title: 'Edit Project',
                                                    submitLabel: 'Save',
                                                  ),
                                            ),
                                          );
                                        },
                                        style: FilledButton.styleFrom(
                                          minimumSize: const Size.fromHeight(
                                            42,
                                          ),
                                          backgroundColor: Colors.white,
                                          foregroundColor: const Color(
                                            0xFF222222,
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        child: const Text('Edit Project'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFE7EDF3)),
                        ),
                        child: Column(
                          children: const [
                            _ProjectMenuTile(label: 'Project details'),
                            _ProjectMenuTile(label: 'Project Analysis'),
                            _ProjectMenuTile(label: 'Team'),
                            _ProjectMenuTile(label: 'Task'),
                            _ProjectMenuTile(label: 'Document', isLast: true),
                          ],
                        ),
                      ),
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

class _ProjectInfoRow extends StatelessWidget {
  const _ProjectInfoRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectMenuTile extends StatelessWidget {
  const _ProjectMenuTile({required this.label, this.isLast = false});

  final String label;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFF0F3F6))),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        minVerticalPadding: 2,
        visualDensity: const VisualDensity(vertical: -1),
        title: Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 18,
            color: const Color(0xFF222222),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Color(0xFF222222),
        ),
        onTap: () {},
      ),
    );
  }
}
