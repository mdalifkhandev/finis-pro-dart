import 'package:flutter/material.dart';

class ProjectWorkerTeamScreen extends StatelessWidget {
  const ProjectWorkerTeamScreen({super.key});

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
                      'Team',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    'Workers (5)',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      color: const Color(0xFF222222),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () => _showAddWorkersSheet(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(118, 42),
                      foregroundColor: const Color(0xFF222222),
                      side: const BorderSide(color: Color(0xFFE2E8EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Worker'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    _LeadCard(),
                    SizedBox(height: 14),
                    _SectionLabel('All Worker'),
                    SizedBox(height: 12),
                    _WorkerCard(isLast: true),
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

void _showAddWorkersSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const _AddWorkersBottomSheet(),
  );
}

class _AddWorkersBottomSheet extends StatelessWidget {
  const _AddWorkersBottomSheet();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(14, 0, 14, bottomInset + 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SheetTitle(),
          SizedBox(height: 12),
          _WorkerPickerCard(
            name: 'Emily Chen',
            role: 'Electrician',
            avatarColor: Color(0xFFD8C7A1),
            isSelected: true,
          ),
          SizedBox(height: 10),
          _WorkerPickerCard(
            name: 'Emily Chen',
            role: 'Electrician',
            avatarColor: Color(0xFFD79DA4),
          ),
          SizedBox(height: 10),
          _WorkerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFC9D0DB),
          ),
          SizedBox(height: 10),
          _WorkerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD8C7A1),
          ),
        ],
      ),
    );
  }
}

class _SheetTitle extends StatelessWidget {
  const _SheetTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add Team Worker',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: const Color(0xFF222222),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _WorkerPickerCard extends StatelessWidget {
  const _WorkerPickerCard({
    required this.name,
    required this.role,
    required this.avatarColor,
    this.isSelected = false,
  });

  final String name;
  final String role;
  final Color avatarColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 24, color: Color(0xFF4C4C4C)),
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
          const SizedBox(width: 10),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF6A6BFF) : Colors.white,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF6A6BFF)
                    : const Color(0xFF8A8A8A),
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
        ],
      ),
    );
  }
}

class _LeadCard extends StatelessWidget {
  const _LeadCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFD0A37D),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 24, color: Color(0xFF4C4C4C)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Smith',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Project Manager',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'john@example.com',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '(555) 123-4567',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 18,
          color: const Color(0xFF222222),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _WorkerCard extends StatelessWidget {
  const _WorkerCard({this.isLast = false});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 14),
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFD8C7A1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 24, color: Color(0xFF4C4C4C)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emily Chen',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Electrician',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.delete_outline_rounded,
            size: 18,
            color: Color(0xFFFF5E5E),
          ),
        ],
      ),
    );
  }
}
