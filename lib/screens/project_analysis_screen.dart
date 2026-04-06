import 'package:flutter/material.dart';
import '../widgets/project/project_analysis_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectAnalysisScreen extends StatelessWidget {
  const ProjectAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              AppScreenHeader(
                title: 'Project Analysis',
                titleStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF222222),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    ProjectAnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Redesign e-Commerce Dashboard',
                      status: 'active',
                      accentColor: Color(0xFF6A6BFF),
                    ),
                    ProjectAnalysisStepCard(
                      title: 'Second Floor',
                      subtitle: 'Redesign e-Commerce Dashboard',
                      metrics: '2 Unites',
                      status: 'active',
                      accentColor: Color(0xFF6A6BFF),
                    ),
                    ProjectAnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Analytics Dashboard UI Update',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFFFC107),
                    ),
                    ProjectAnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Design System Creation',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFFFC107),
                    ),
                    ProjectAnalysisStepCard(
                      title: 'Lobby',
                      subtitle: 'Mental Health App',
                      metrics: '2 Unites',
                      status: 'pending',
                      accentColor: Color(0xFFD9D9D9),
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
