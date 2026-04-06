import 'package:flutter/material.dart';

import 'task_assign_screen.dart';
import '../widgets/shared/app_screen_header.dart';
import '../widgets/task/task_create_widgets.dart';

class TaskCreateScreen extends StatelessWidget {
  const TaskCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Create New Task'),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TaskFieldLabel('Task Title'),
                      const SizedBox(height: 8),
                      const TaskFormField(hintText: 'Enter task title'),
                      const SizedBox(height: 14),
                      const TaskFieldLabel('Project'),
                      const SizedBox(height: 8),
                      const TaskFormField(hintText: ''),
                      const SizedBox(height: 14),
                      const TaskFieldLabel('Description'),
                      const SizedBox(height: 8),
                      const TaskFormField(
                        hintText: 'Task description',
                        maxLines: 4,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: const [
                          Expanded(child: TaskFieldLabel('Priority')),
                          SizedBox(width: 12),
                          Expanded(child: TaskFieldLabel('Due Date')),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Expanded(child: TaskFormField(hintText: '')),
                          SizedBox(width: 12),
                          Expanded(child: TaskFormField(hintText: '')),
                        ],
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => const TaskAssignScreen(),
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
                          child: const Text(
                            'Next: Assign Task',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
