import 'package:flutter/material.dart';
import '../widgets/company/company_document_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

class CompanyDocumentsScreen extends StatelessWidget {
  const CompanyDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              const AppScreenHeader(title: 'Documents'),
              const SizedBox(height: 28),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    CompanyDocumentCard(
                      title: 'Project Blueprint.pdf',
                      typeAndSize: 'PDF • 2.4 MB',
                      uploadedBy: 'Uploaded by John Smith on 1/15/2025',
                    ),
                    CompanyDocumentCard(
                      title: 'Safety Guidelines.docx',
                      typeAndSize: 'DOCX • 856 KB',
                      uploadedBy: 'Uploaded by Emily Chen on 1/16/2025',
                    ),
                    CompanyDocumentCard(
                      title: 'Budget Breakdown.xlsx',
                      typeAndSize: 'XLSX • 1.2 MB',
                      uploadedBy: 'Uploaded by Sarah Johnson on 1/17/2025',
                    ),
                    CompanyDocumentCard(
                      title: 'Site Photos.zip',
                      typeAndSize: 'ZIP • 15.8 MB',
                      uploadedBy: 'Uploaded by Mike Davis on 1/18/2025',
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
