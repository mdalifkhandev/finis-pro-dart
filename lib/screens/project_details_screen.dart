import 'package:flutter/material.dart';

import 'create_project_screen.dart';
import 'company_documents_screen.dart';
import 'floor_room_setup_screen.dart';
import 'project_analysis_screen.dart';
import 'project_budget_details_screen.dart';
import 'project_task_screen.dart';
import 'project_team_screen.dart';
import '../widgets/project/project_details_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Projects details'),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      ProjectDetailsHeroCard(
                        onFloorPlan: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  const FloorRoomSetupScreen(),
                            ),
                          );
                        },
                        onEditProject: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => const CreateProjectScreen(
                                title: 'Edit Project',
                                submitLabel: 'Save',
                              ),
                            ),
                          );
                        },
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
                          children: [
                            ProjectMenuTile(
                              label: 'Project details',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const ProjectBudgetDetailsScreen(),
                                  ),
                                );
                              },
                            ),
                            ProjectMenuTile(
                              label: 'Project Analysis',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const ProjectAnalysisScreen(),
                                  ),
                                );
                              },
                            ),
                            ProjectMenuTile(
                              label: 'Team',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const ProjectTeamScreen(),
                                  ),
                                );
                              },
                            ),
                            ProjectMenuTile(
                              label: 'Task',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const ProjectTaskScreen(),
                                  ),
                                );
                              },
                            ),
                            ProjectMenuTile(
                              label: 'Document',
                              isLast: true,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const CompanyDocumentsScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
