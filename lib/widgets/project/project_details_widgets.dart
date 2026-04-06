import 'package:flutter/material.dart';

class ProjectDetailsHeroCard extends StatelessWidget {
  const ProjectDetailsHeroCard({
    super.key,
    required this.onFloorPlan,
    required this.onEditProject,
  });

  final VoidCallback onFloorPlan;
  final VoidCallback onEditProject;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF245778),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: -30,
            top: 4,
            child: _ProjectHeroRing(width: 132, height: 132, alpha: 0.08),
          ),
          const Positioned(
            right: 18,
            top: -20,
            child: _ProjectHeroRing(width: 120, height: 120, alpha: 0.10),
          ),
          const Positioned(
            right: -24,
            bottom: -12,
            child: _ProjectHeroRing(width: 148, height: 148, alpha: 0.08),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Riverside Tower',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '@maya.louis',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFB9D4E3),
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
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.24),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Column(
                  children: [
                    ProjectDetailsInfoRow(
                      icon: Icons.location_on_outlined,
                      label: '123 Construction Blvd, Toronto, ON',
                    ),
                    SizedBox(height: 12),
                    ProjectDetailsInfoRow(
                      icon: Icons.business_outlined,
                      label: 'Horizon Builders Inc.',
                    ),
                    SizedBox(height: 12),
                    ProjectDetailsInfoRow(
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
                      onPressed: onFloorPlan,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(42),
                        backgroundColor: const Color(0xFFC4E7FF),
                        foregroundColor: const Color(0xFF173D56),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Floor plan'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: onEditProject,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(42),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF222222),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
    );
  }
}

class ProjectDetailsInfoRow extends StatelessWidget {
  const ProjectDetailsInfoRow({
    super.key,
    required this.icon,
    required this.label,
  });

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

class ProjectMenuTile extends StatelessWidget {
  const ProjectMenuTile({
    super.key,
    required this.label,
    this.isLast = false,
    this.onTap,
  });

  final String label;
  final bool isLast;
  final VoidCallback? onTap;

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
        onTap: onTap ?? () {},
      ),
    );
  }
}

class _ProjectHeroRing extends StatelessWidget {
  const _ProjectHeroRing({
    required this.width,
    required this.height,
    required this.alpha,
  });

  final double width;
  final double height;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: alpha),
          width: 8,
        ),
      ),
    );
  }
}
