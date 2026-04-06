import 'package:flutter/material.dart';

import 'assigned_projects_screen.dart';
import 'company_contacts_screen.dart';
import 'company_documents_screen.dart';
import 'company_geofencing_screen.dart';
import '../widgets/company/company_detail_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class CompanyDetailScreen extends StatelessWidget {
  const CompanyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Company'),
              const SizedBox(height: 16),
              const CompanyDetailHeroCard(),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE7EDF3)),
                ),
                child: Column(
                  children: [
                    CompanyOptionTile(
                      label: 'Assigned Projects',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const AssignedProjectsScreen(),
                          ),
                        );
                      },
                    ),
                    CompanyOptionTile(
                      label: 'Contacts',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const CompanyContactsScreen(),
                          ),
                        );
                      },
                    ),
                    CompanyOptionTile(
                      label: 'Documents',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const CompanyDocumentsScreen(),
                          ),
                        );
                      },
                    ),
                    CompanyOptionTile(
                      label: 'Geofencing',
                      isLast: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const CompanyGeofencingScreen(),
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
