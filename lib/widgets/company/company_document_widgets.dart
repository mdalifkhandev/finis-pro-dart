import 'package:flutter/material.dart';

class CompanyDocumentCard extends StatelessWidget {
  const CompanyDocumentCard({
    super.key,
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
      margin: const EdgeInsets.only(bottom: 12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFDCEBFF),
              borderRadius: BorderRadius.circular(5),
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
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  typeAndSize,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF444444),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  uploadedBy,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8A939D),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: () {},
            constraints: const BoxConstraints.tightFor(width: 22, height: 22),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            icon: const Icon(
              Icons.download_outlined,
              size: 17,
              color: Color(0xFF224E6D),
            ),
          ),
        ],
      ),
    );
  }
}
