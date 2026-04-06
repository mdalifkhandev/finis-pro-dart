import 'package:flutter/material.dart';

void showAddManagersSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const AddManagersBottomSheet(),
  );
}

class AddManagersBottomSheet extends StatelessWidget {
  const AddManagersBottomSheet({super.key});

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
          const ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD0A37D),
            isSelected: true,
          ),
          const SizedBox(height: 10),
          const ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD79DA4),
          ),
          const SizedBox(height: 10),
          const ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFC9D0DB),
          ),
          const SizedBox(height: 10),
          const ManagerPickerCard(
            name: 'Emily Chen',
            role: 'Safety Officer',
            avatarColor: Color(0xFFD8C7A1),
          ),
        ],
      ),
    );
  }
}

class ManagerPickerCard extends StatelessWidget {
  const ManagerPickerCard({
    super.key,
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
            decoration: BoxDecoration(color: avatarColor, shape: BoxShape.circle),
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

class ProjectTeamMemberCard extends StatelessWidget {
  const ProjectTeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.avatarColor,
    this.isLast = false,
    this.onTap,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final Color avatarColor;
  final bool isLast;
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
                decoration: BoxDecoration(color: avatarColor, shape: BoxShape.circle),
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
        ),
      ),
    );
  }
}
