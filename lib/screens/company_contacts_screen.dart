import 'package:flutter/material.dart';
import '../widgets/company/company_contact_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class CompanyContactsScreen extends StatelessWidget {
  const CompanyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Contacts'),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    CompanyContactCard(
                      name: 'Doctor Jamie F. Jones',
                      role: 'Project Manager',
                      accentColor: Color(0xFF7A5C42),
                      avatarColor: Color(0xFFD6B18C),
                    ),
                    CompanyContactCard(
                      name: 'Doctor Jamie F. Jones',
                      role: 'Site Supervisor',
                      accentColor: Color(0xFF606060),
                      avatarColor: Color(0xFFD2B48C),
                    ),
                    CompanyContactCard(
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
