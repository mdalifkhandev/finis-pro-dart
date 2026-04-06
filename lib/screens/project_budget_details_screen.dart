import 'package:flutter/material.dart';
import '../widgets/project/project_budget_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class ProjectBudgetDetailsScreen extends StatelessWidget {
  const ProjectBudgetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Project Details'),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    children: const [
                      ProjectBudgetCard(
                        label: 'Total Budget',
                        value: '\$2,500,000',
                        valueColor: Color(0xFF174E99),
                      ),
                      SizedBox(height: 10),
                      ProjectSpentCard(),
                      SizedBox(height: 10),
                      ProjectBudgetCard(
                        label: 'Remaining',
                        value: '\$625,000',
                        valueColor: Color(0xFF19B652),
                      ),
                      SizedBox(height: 10),
                      ProjectClientCard(),
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
