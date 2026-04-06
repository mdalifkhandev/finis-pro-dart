import 'package:flutter/material.dart';

import 'task_details_screen.dart';
import 'task_create_screen.dart';

class ProjectTaskScreen extends StatelessWidget {
  const ProjectTaskScreen({super.key});

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
              SizedBox(
                height: 36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    Text(
                      'Task',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
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
                  _FilterChip(label: 'All', selected: true),
                  SizedBox(width: 8),
                  _FilterChip(label: 'Progress'),
                  SizedBox(width: 8),
                  _FilterChip(label: 'Pending'),
                  SizedBox(width: 8),
                  _FilterChip(label: 'Completed'),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: [
                    _TaskCard(
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
                    _TaskCard(
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
                    _TaskCard(
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

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF245778) : const Color(0xFFF1F8FA),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? const Color(0xFF245778) : const Color(0xFFD7E6EA),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF43505A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.status,
    required this.statusColor,
    required this.statusBackground,
    this.onTap,
  });

  final String status;
  final Color statusColor;
  final Color statusBackground;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE7EDF3)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0C0B2239),
                blurRadius: 14,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 20,
                    color: Color(0xFF3C78FF),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Install electrical wiring - Floor 2',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Riverside Tower',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF5E6873),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Jan 15',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5E6873),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline_rounded,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Mike Johnson',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF5E6873),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.access_time_rounded,
                    size: 18,
                    color: Color(0xFF5E6873),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Jan 18',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5E6873),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusBackground,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      status,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Update Status',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF245778),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
