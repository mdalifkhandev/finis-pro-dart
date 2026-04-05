import 'package:flutter/material.dart';

class CompanyDocumentsScreen extends StatelessWidget {
  const CompanyDocumentsScreen({super.key});

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
                      'Documents',
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
                    _DocumentCard(
                      title: 'Project Blueprint.pdf',
                      typeAndSize: 'PDF • 2.4 MB',
                      uploadedBy: 'Uploaded by John Smith on 1/15/2025',
                    ),
                    _DocumentCard(
                      title: 'Safety Guidelines.docx',
                      typeAndSize: 'DOCX • 856 KB',
                      uploadedBy: 'Uploaded by Emily Chen on 1/16/2025',
                    ),
                    _DocumentCard(
                      title: 'Budget Breakdown.xlsx',
                      typeAndSize: 'XLSX • 1.2 MB',
                      uploadedBy: 'Uploaded by Sarah Johnson on 1/17/2025',
                    ),
                    _DocumentCard(
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

class _DocumentCard extends StatelessWidget {
  const _DocumentCard({
    required this.title,
    required this.typeAndSize,
    required this.uploadedBy,
  });

  final String title;
  final String typeAndSize;
  final String uploadedBy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
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
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFDCEBFF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.description_outlined,
              size: 18,
              color: Color(0xFF3F73FF),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  typeAndSize,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF444444),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  uploadedBy,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8A939D),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            constraints: const BoxConstraints.tightFor(width: 24, height: 24),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            icon: const Icon(
              Icons.download_for_offline_outlined,
              size: 18,
              color: Color(0xFF224E6D),
            ),
          ),
        ],
      ),
    );
  }
}
