import 'package:flutter/material.dart';

class ProjectAnalysisScreen extends StatelessWidget {
  const ProjectAnalysisScreen({super.key});

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
                      'Project Analysis',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    _AnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Redesign e-Commerce Dashboard',
                      status: 'active',
                      accentColor: Color(0xFF6A6BFF),
                    ),
                    _AnalysisStepCard(
                      title: 'Second Floor',
                      subtitle: 'Redesign e-Commerce Dashboard',
                      metrics: '2 Unites',
                      status: 'active',
                      accentColor: Color(0xFF6A6BFF),
                    ),
                    _AnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Analytics Dashboard UI Update',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFFFC107),
                    ),
                    _AnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Design System Creation',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFFFC107),
                    ),
                    _AnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Mental Health App',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFD9D9D9),
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalysisStepCard extends StatelessWidget {
  const _AnalysisStepCard({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.accentColor,
    this.metrics = '2 Unites',
    this.isLast = false,
  });

  final String title;
  final String subtitle;
  final String metrics;
  final String status;
  final Color accentColor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'active';
    final theme = Theme.of(context);

    return SizedBox(
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF6A6BFF) : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive
                    ? const Color(0xFF6A6BFF)
                    : const Color(0xFF8A8A8A),
                width: 2,
              ),
            ),
            child: isActive
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 94,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFE8E9FF) : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isActive
                      ? const Color(0xFFE8E9FF)
                      : const Color(0xFFE2E2E2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(14),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: const Color(0xFF222222),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF666666),
                              fontSize: 11.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                metrics,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF222222),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '•',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.calendar_month_outlined,
                                size: 13,
                                color: Color(0xFF222222),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'today',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF222222),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
