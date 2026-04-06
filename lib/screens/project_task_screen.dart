import 'package:flutter/material.dart';

import 'task_details_screen.dart';
import 'task_create_screen.dart';
import '../widgets/project/project_task_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectTaskScreen extends StatelessWidget {
  const ProjectTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Task'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const TaskCreateScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(46),
                    backgroundColor: const Color(0xFF245778),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text(
                    'Create New Task',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search......',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9AA3AD),
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: Color(0xFF7F8892),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF245778)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  ProjectTaskFilterChip(label: 'All', selected: true),
                  SizedBox(width: 8),
                  ProjectTaskFilterChip(label: 'Progress'),
                  SizedBox(width: 8),
                  ProjectTaskFilterChip(label: 'Pending'),
                  SizedBox(width: 8),
                  ProjectTaskFilterChip(label: 'Completed'),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: [
                    ProjectTaskCard(
                      status: 'In Progress',
                      statusColor: Color(0xFF3C78FF),
                      statusBackground: Color(0xFFE4EEFF),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const TaskDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    ProjectTaskCard(
                      status: 'Pending',
                      statusColor: Color(0xFFFF8A00),
                      statusBackground: Color(0xFFFBE8D5),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const TaskDetailsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    ProjectTaskCard(
                      status: 'Completed',
                      statusColor: Color(0xFF148F67),
                      statusBackground: Color(0xFFDDF4EA),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const TaskDetailsScreen(),
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
