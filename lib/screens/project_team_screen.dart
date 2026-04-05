import 'package:flutter/material.dart';

class ProjectTeamScreen extends StatelessWidget {
  const ProjectTeamScreen({super.key});

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
                    'Managers (5)',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      color: const Color(0xFF222222),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () => _showAddManagersSheet(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(132, 42),
                      foregroundColor: const Color(0xFF222222),
                      side: const BorderSide(color: Color(0xFFE2E8EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Managers'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 18),
                  children: const [
                    _MemberCard(
                      name: 'John Smith',
                      role: 'Project Manager',
                      email: 'john@example.com',
                      phone: '(555) 123-4567',
                      avatarColor: Color(0xFFD0A37D),
                    ),
                    _MemberCard(
                      name: 'Sarah Johnson',
                      role: 'Site Engineer',
                      email: 'sarah@example.com',
                      phone: '(555) 234-5678',
                      avatarColor: Color(0xFFD8C7A1),
                    ),
                    _MemberCard(
                      name: 'Mike Davis',
                      role: 'Foreman',
                      email: 'mike@example.com',
                      phone: '(555) 345-6789',
                      avatarColor: Color(0xFFC9D0DB),
                    ),
                    _MemberCard(
                      name: 'Emily Chen',
                      role: 'Safety Officer',
                      email: 'emily@example.com',
                      phone: '(555) 456-7890',
                      avatarColor: Color(0xFFD79DA4),
                    ),
                    _MemberCard(
                      name: 'Emily Chen',
                      role: 'Safety Officer',
                      email: 'emily@example.com',
                      phone: '(555) 456-7890',
                      avatarColor: Color(0xFFD79DA4),
                      isLast: true,
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

void _showAddManagersSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const _AddManagersBottomSheet(),
  );
}

class _AddManagersBottomSheet extends StatelessWidget {
  const _AddManagersBottomSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(14, 0, 14, bottomInset + 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Team Managers',
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          const _ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD0A37D),
            isSelected: true,
          ),
          const SizedBox(height: 10),
          const _ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD79DA4),
          ),
          const SizedBox(height: 10),
          const _ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFC9D0DB),
          ),
          const SizedBox(height: 10),
          const _ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD8C7A1),
          ),
        ],
      ),
    );
  }
}

class _ManagerPickerCard extends StatelessWidget {
  const _ManagerPickerCard({
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

class _MemberCard extends StatelessWidget {
  const _MemberCard({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.avatarColor,
    this.isLast = false,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final Color avatarColor;
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 8),
                Text(
                  email,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  phone,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
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
