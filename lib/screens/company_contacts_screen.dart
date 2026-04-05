import 'package:flutter/material.dart';

class CompanyContactsScreen extends StatelessWidget {
  const CompanyContactsScreen({super.key});

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
                      'Contacts',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    _ContactCard(
                      name: 'Doctor Jamie F. Jones',
                      role: 'Project Manager',
                      accentColor: Color(0xFF7A5C42),
                      avatarColor: Color(0xFFD6B18C),
                    ),
                    _ContactCard(
                      name: 'Doctor Jamie F. Jones',
                      role: 'Site Supervisor',
                      accentColor: Color(0xFF606060),
                      avatarColor: Color(0xFFD2B48C),
                    ),
                    _ContactCard(
                      name: 'Doctor Jamie F. Jones',
                      role: 'Safety Officer',
                      accentColor: Color(0xFF6B2E4A),
                      avatarColor: Color(0xFFE2A0B7),
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

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.name,
    required this.role,
    required this.accentColor,
    required this.avatarColor,
  });

  final String name;
  final String role;
  final Color accentColor;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x110B2239),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: avatarColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, size: 24, color: accentColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF7B8590),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: _ActionButton(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF222222),
                  borderColor: Color(0xFFE2E7EC),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.call_outlined,
                  label: 'Call',
                  backgroundColor: Color(0xFFCBEAFF),
                  foregroundColor: Color(0xFF224E6D),
                  borderColor: Color(0xFFCBEAFF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: foregroundColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
