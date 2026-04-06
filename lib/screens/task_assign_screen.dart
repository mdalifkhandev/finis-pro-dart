import 'package:flutter/material.dart';
import '../widgets/shared/app_screen_header.dart';
import '../widgets/task/task_assign_widgets.dart';

class TaskAssignScreen extends StatelessWidget {
  const TaskAssignScreen({super.key});

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
              const AppScreenHeader(title: 'Assign Task'),
              const SizedBox(height: 28),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search workers',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9AA3AD),
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: Color(0xFF8A939D),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF245778)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Workers',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF43505A),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    AssignWorkerCard(
                      initials: 'M',
                      name: 'Mike Johnson',
                      role: 'Electrician',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    AssignWorkerCard(
                      initials: 'S',
                      name: 'Sarah Davis',
                      role: 'Plumber',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    AssignWorkerCard(
                      initials: 'T',
                      name: 'Tom Wilson',
                      role: 'Carpenter',
                    ),
                    SizedBox(height: 10),
                    AssignWorkerCard(
                      initials: 'J',
                      name: 'John Smith',
                      role: 'Painter',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    AssignWorkerCard(
                      initials: 'R',
                      name: 'Robert Brown',
                      role: 'HVAC Technician',
                      showBadge: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(46),
                      backgroundColor: const Color(0xFF245778),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Confirm Assignment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
