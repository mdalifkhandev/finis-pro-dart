import 'package:flutter/material.dart';

import 'create_project_screen.dart';
import 'project_details_screen.dart';
import '../widgets/project/assigned_project_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class AssignedProjectsScreen extends StatelessWidget {
  const AssignedProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Assigned Projects'),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    AssignedProjectCard(
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
                    AssignedProjectCard(
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
                    AssignedProjectCard(
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
