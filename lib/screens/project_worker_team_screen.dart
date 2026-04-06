import 'package:flutter/material.dart';
import '../widgets/project/project_worker_team_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectWorkerTeamScreen extends StatelessWidget {
  const ProjectWorkerTeamScreen({super.key});

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
              const AppScreenHeader(title: 'Team'),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    'Workers (5)',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      color: const Color(0xFF222222),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () => showAddWorkersSheet(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(118, 42),
                      foregroundColor: const Color(0xFF222222),
                      side: const BorderSide(color: Color(0xFFE2E8EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Worker'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    ProjectWorkerLeadCard(),
                    SizedBox(height: 14),
                    ProjectWorkerSectionLabel('All Worker'),
                    SizedBox(height: 12),
                    ProjectWorkerCard(isLast: true),
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
