import 'package:flutter/material.dart';

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
                      'Assign Task',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
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
                    _AssignWorkerCard(
                      initials: 'M',
                      name: 'Mike Johnson',
                      role: 'Electrician',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    _AssignWorkerCard(
                      initials: 'S',
                      name: 'Sarah Davis',
                      role: 'Plumber',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    _AssignWorkerCard(
                      initials: 'T',
                      name: 'Tom Wilson',
                      role: 'Carpenter',
                    ),
                    SizedBox(height: 10),
                    _AssignWorkerCard(
                      initials: 'J',
                      name: 'John Smith',
                      role: 'Painter',
                      showBadge: true,
                    ),
                    SizedBox(height: 10),
                    _AssignWorkerCard(
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

class _AssignWorkerCard extends StatelessWidget {
  const _AssignWorkerCard({
    required this.initials,
    required this.name,
    required this.role,
    this.showBadge = false,
  });

  final String initials;
  final String name;
  final String role;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7EDF3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C0B2239),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFF245778),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  role,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
              ],
            ),
          ),
          if (showBadge) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF4EA),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Available',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF148F67),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(60, 32),
              foregroundColor: const Color(0xFF245778),
              side: const BorderSide(color: Color(0xFF245778)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text('Assign'),
          ),
        ],
      ),
    );
  }
}
