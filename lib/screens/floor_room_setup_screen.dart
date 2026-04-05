import 'package:flutter/material.dart';

class FloorRoomSetupScreen extends StatelessWidget {
  const FloorRoomSetupScreen({super.key});

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
                      'Floor & Room Setup',
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
                    'Floors (5)',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 28,
                      color: const Color(0xFF222222),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () => _showAddFloorSheet(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(88, 38),
                      foregroundColor: const Color(0xFF222222),
                      side: const BorderSide(color: Color(0xFFE1E8EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Floor'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    children: const [
                      _FloorCard(
                        statusLabel: 'Completed',
                        statusColor: Color(0xFF46C26F),
                      ),
                      SizedBox(height: 12),
                      _FloorCard(
                        statusLabel: 'In Progress',
                        statusColor: Color(0xFF4C8DFF),
                        collapsed: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showAddFloorSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const _AddFloorBottomSheet(),
  );
}

class _AddFloorBottomSheet extends StatelessWidget {
  const _AddFloorBottomSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add New Room',
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(child: _SheetInput(height: 48)),
              SizedBox(width: 12),
              Text(
                'to',
                style: TextStyle(fontSize: 16, color: Color(0xFF222222)),
              ),
              SizedBox(width: 12),
              Expanded(child: _SheetInput(height: 48)),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: const Color(0xFF2A5977),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetInput extends StatelessWidget {
  const _SheetInput({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        style: const TextStyle(fontSize: 14, color: Color(0xFF222222)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFCFD6DD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFCFD6DD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF2A5977)),
          ),
        ),
      ),
    );
  }
}

class _FloorCard extends StatelessWidget {
  const _FloorCard({
    required this.statusLabel,
    required this.statusColor,
    this.collapsed = false,
  });

  final String statusLabel;
  final Color statusColor;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4EAF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ground Floor',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '8 rooms',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF6F7B86),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
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
          const SizedBox(height: 14),
          Row(
            children: const [
              Expanded(
                child: _ProgressStat(
                  value: '8',
                  label: 'Completed',
                  valueColor: Color(0xFF46C26F),
                ),
              ),
              Expanded(
                child: _ProgressStat(
                  value: '0',
                  label: 'In Progress',
                  valueColor: Color(0xFF4C8DFF),
                ),
              ),
              Expanded(
                child: _ProgressStat(
                  value: '0',
                  label: 'Not Started',
                  valueColor: Color(0xFF6F7B86),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'View Room Details',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF224E6D),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (!collapsed) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(36),
                  backgroundColor: const Color(0xFFC8E7FB),
                  foregroundColor: const Color(0xFF173D56),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('+ Add New Room'),
              ),
            ),
            const SizedBox(height: 10),
            const _RoomRow(title: 'Room : 1', subtitle: 'Common • 450 sq ft'),
            const _RoomRow(title: 'Room : 2', subtitle: 'Office • 120 sq ft'),
            const _RoomRow(title: 'Room : 3', subtitle: 'Common • 200 sq ft'),
            const _RoomRow(title: 'Room : 4', subtitle: 'Common • 80 sq ft'),
            const _RoomRow(title: 'Room : 5', subtitle: 'Utility • 60 sq ft'),
            const _RoomRow(title: 'Room : 6', subtitle: 'Utility • 60 sq ft'),
            const _RoomRow(title: 'Room : 7', subtitle: 'Utility • 100 sq ft'),
            const _RoomRow(
              title: 'Room : 8',
              subtitle: 'Utility • 90 sq ft',
              isLast: true,
            ),
          ],
        ],
      ),
    );
  }
}

class _ProgressStat extends StatelessWidget {
  const _ProgressStat({
    required this.value,
    required this.label,
    required this.valueColor,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: valueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6F7B86)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _RoomRow extends StatelessWidget {
  const _RoomRow({
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  final String title;
  final String subtitle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6F7B86),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFDCF8E5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Completed',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF46C26F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF224E6D)),
          const SizedBox(width: 10),
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
