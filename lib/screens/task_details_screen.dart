import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
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
                      'Site Cleanup - Zone A',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _TaskInfoCard(),
                      SizedBox(height: 10),
                      _SectionTitle('Before Photo'),
                      SizedBox(height: 6),
                      _PhotoCard(),
                      SizedBox(height: 10),
                      _SectionTitle('After Photo'),
                      SizedBox(height: 6),
                      _PhotoCard(),
                      SizedBox(height: 10),
                      _SummaryCard(),
                      SizedBox(height: 10),
                      _InventoryCard(),
                      SizedBox(height: 10),
                      _ExpensesCard(),
                      SizedBox(height: 10),
                      _ReviewDecisionCard(),
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

class _TaskInfoCard extends StatelessWidget {
  const _TaskInfoCard();

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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Details',
            style: theme.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Install electrical wiring and outlets for Room 302.\nEnsure all connections are secure and compliant.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF8A939D),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          const _InfoTileRow(
            leftIcon: Icons.work_outline_rounded,
            leftLabel: 'Project',
            leftValue: 'Downtown Plaza',
            rightChip: 'PENDING',
          ),
          const SizedBox(height: 6),
          const _InfoTileRow(
            leftIcon: Icons.person_outline_rounded,
            leftLabel: 'Assigned To',
            leftValue: 'Michael Torres',
          ),
          const SizedBox(height: 6),
          const _InfoTileRow(
            leftIcon: Icons.calendar_today_outlined,
            leftLabel: 'Due Date',
            leftValue: 'Jan 15, 2026',
          ),
          const SizedBox(height: 6),
          const _InfoTileRow(
            leftIcon: Icons.access_time_rounded,
            leftLabel: 'Estimated Time',
            leftValue: '4 hours',
          ),
        ],
      ),
    );
  }
}

class _InfoTileRow extends StatelessWidget {
  const _InfoTileRow({
    required this.leftIcon,
    required this.leftLabel,
    required this.leftValue,
    this.rightChip,
  });

  final IconData leftIcon;
  final String leftLabel;
  final String leftValue;
  final String? rightChip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7EDF3)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFEAF2FF),
              shape: BoxShape.circle,
            ),
            child: Icon(leftIcon, size: 18, color: const Color(0xFF6A7480)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leftLabel,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8A939D),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  leftValue,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (rightChip != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE4EEFF),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                rightChip!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF3C78FF),
                  fontWeight: FontWeight.w600,
                  fontSize: 10.5,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.camera_alt_outlined,
          size: 14,
          color: Color(0xFF5E6873),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color(0xFF222222),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE7EDF3)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Color(0xFF111111), Color(0xFF2A2A2A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 18,
              child: Container(
                width: 72,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 38,
              child: Container(
                width: 20,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF6EB6FF),
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFF6EB6FF), blurRadius: 8),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 18,
              top: 38,
              child: Container(
                width: 20,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF6EB6FF),
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFF6EB6FF), blurRadius: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE7EDF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Report Summary',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '"Cleared all debris from the main entrance area. Swept the concrete pad and removed waste to designated skip bin."',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF8A939D),
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SmallSectionTitle('INVENTORY USED'),
          SizedBox(height: 8),
          _InventoryRow(label: 'Heavy Duty Trash Bags', value: '10 pcs'),
          SizedBox(height: 8),
          _InventoryRow(label: 'Industrial Degreaser', value: '2 liters'),
          SizedBox(height: 8),
          _InventoryRow(label: 'Absorbent Sand', value: '5 kg'),
        ],
      ),
    );
  }
}

class _InventoryRow extends StatelessWidget {
  const _InventoryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE7EDF3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C0B2239),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: const Color(0xFF5E6873)),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpensesCard extends StatelessWidget {
  const _ExpensesCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE7EDF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SmallSectionTitle('Task Expenses'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBFD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: const [
                _ExpenseRow(
                  left: 'Disposal Fees',
                  middle: '1 unit',
                  right: '\$120',
                  isHeader: true,
                ),
                Divider(height: 12),
                _ExpenseRow(
                  left: 'Waste Collection Bags',
                  middle: '10 pcs',
                  right: '\$45',
                ),
                Divider(height: 12),
                _ExpenseRow(
                  left: 'Surface Degreaser',
                  middle: '2 ltr',
                  right: '\$28',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseRow extends StatelessWidget {
  const _ExpenseRow({
    required this.left,
    required this.middle,
    required this.right,
    this.isHeader = false,
  });

  final String left;
  final String middle;
  final String right;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: isHeader ? const Color(0xFF8A939D) : const Color(0xFF5E6873),
      fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
    );

    return Row(
      children: [
        Expanded(flex: 5, child: Text(left, style: style)),
        Expanded(
          flex: 2,
          child: Text(middle, style: style, textAlign: TextAlign.center),
        ),
        Expanded(
          flex: 2,
          child: Text(
            right,
            style: style?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _ReviewDecisionCard extends StatelessWidget {
  const _ReviewDecisionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review & Decision',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Description',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: const Color(0xFF8A939D)),
          ),
          const SizedBox(height: 4),
          const _ReviewField(hintText: 'Review description'),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(42),
                backgroundColor: const Color(0xFF245778),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.upload_file_rounded, size: 18),
              label: const Text('Upload File'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    foregroundColor: const Color(0xFF5E6873),
                    side: const BorderSide(color: Color(0xFFDDE5EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Reject Task'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: const Color(0xFF3C78FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Approve Work'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReviewField extends StatelessWidget {
  const _ReviewField({required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF9AA3AD), fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE5EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF245778)),
        ),
      ),
    );
  }
}

class _SmallSectionTitle extends StatelessWidget {
  const _SmallSectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: const Color(0xFF8A939D),
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
      ),
    );
  }
}
