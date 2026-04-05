import 'package:flutter/material.dart';

import '../../models/app_role.dart';

class InviteMemberDialog extends StatelessWidget {
  const InviteMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Add Specification',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF2A5977),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Color(0xFF18435E)),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const Divider(height: 16, color: Color(0xFFE2E8F0)),
            Text(
              'Add email or phone number',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                fillColor: const Color(0xFFF1F8FC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<AppRole>(
              initialValue: AppRole.admin,
              items: const [
                DropdownMenuItem(value: AppRole.admin, child: Text('Admin')),
                DropdownMenuItem(
                  value: AppRole.manager,
                  child: Text('Manager'),
                ),
                DropdownMenuItem(value: AppRole.worker, child: Text('Worker')),
              ],
              onChanged: (_) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                fillColor: const Color(0xFFF1F8FC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      side: const BorderSide(color: Color(0xFF2A5977)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      backgroundColor: const Color(0xFF2A5977),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Invite'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
