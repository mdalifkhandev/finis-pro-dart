import 'package:flutter/material.dart';

import 'project_worker_team_screen.dart';
import '../widgets/project/project_team_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectTeamScreen extends StatelessWidget {
  const ProjectTeamScreen({super.key});

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
                    'Managers (5)',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      color: const Color(0xFF222222),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () => showAddManagersSheet(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(132, 42),
                      foregroundColor: const Color(0xFF222222),
                      side: const BorderSide(color: Color(0xFFE2E8EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Managers'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: [
                    ProjectTeamMemberCard(
                      name: 'John Smith',
                      role: 'Project Manager',
                      email: 'john@example.com',
                      phone: '(555) 123-4567',
                      avatarColor: Color(0xFFD0A37D),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const ProjectWorkerTeamScreen(),
                          ),
                        );
                      },
                    ),
                    ProjectTeamMemberCard(
                      name: 'Sarah Johnson',
                      role: 'Site Engineer',
                      email: 'sarah@example.com',
                      phone: '(555) 234-5678',
                      avatarColor: Color(0xFFD8C7A1),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const ProjectWorkerTeamScreen(),
                          ),
                        );
                      },
                    ),
                    ProjectTeamMemberCard(
                      name: 'Mike Davis',
                      role: 'Foreman',
                      email: 'mike@example.com',
                      phone: '(555) 345-6789',
                      avatarColor: Color(0xFFC9D0DB),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const ProjectWorkerTeamScreen(),
                          ),
                        );
                      },
                    ),
                    ProjectTeamMemberCard(
                      name: 'Emily Chen',
                      role: 'Safety Officer',
                      email: 'emily@example.com',
                      phone: '(555) 456-7890',
                      avatarColor: Color(0xFFD79DA4),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const ProjectWorkerTeamScreen(),
                          ),
                        );
                      },
                    ),
                    ProjectTeamMemberCard(
                      name: 'Emily Chen',
                      role: 'Safety Officer',
                      email: 'emily@example.com',
                      phone: '(555) 456-7890',
                      avatarColor: Color(0xFFD79DA4),
                      isLast: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const ProjectWorkerTeamScreen(),
                          ),
                        );
                      },
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
