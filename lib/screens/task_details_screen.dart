import 'package:flutter/material.dart';
import '../widgets/shared/app_screen_header.dart';
import '../widgets/task/task_detail_widgets.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Column(
            children: [
              AppScreenHeader(
                title: 'Site Cleanup - Zone A',
                titleStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF222222),
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TaskInfoCard(),
                      SizedBox(height: 10),
                      TaskSectionTitle('Before Photo'),
                      SizedBox(height: 6),
                      TaskPhotoCard(),
                      SizedBox(height: 10),
                      TaskSectionTitle('After Photo'),
                      SizedBox(height: 6),
                      TaskPhotoCard(),
                      SizedBox(height: 10),
                      TaskSummaryCard(),
                      SizedBox(height: 10),
                      TaskInventoryCard(),
                      SizedBox(height: 10),
                      TaskExpensesCard(),
                      SizedBox(height: 10),
                      TaskReviewDecisionCard(),
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
