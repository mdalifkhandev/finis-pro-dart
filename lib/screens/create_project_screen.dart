import 'package:flutter/material.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({
    super.key,
    this.title = 'Create New Project',
    this.submitLabel = 'Create Project & Setup Floors',
  });

  final String title;
  final String submitLabel;

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  String _company = 'CC.LTD';
  String _projectType = 'Apartment Building';
  bool _budgetEnabled = true;

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
                      widget.title,
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionLabel('Project Name'),
                      const SizedBox(height: 8),
                      const _ProjectTextField(hintText: 'Enter project name'),
                      const SizedBox(height: 14),
                      const _SectionLabel('Company'),
                      const SizedBox(height: 8),
                      _DropdownField<String>(
                        value: _company,
                        items: const ['CC.LTD', 'Summit Construction', 'Finis'],
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _company = value);
                        },
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: const [
                          Expanded(child: _SectionLabel('Start Date')),
                          SizedBox(width: 10),
                          Expanded(child: _SectionLabel('End Date')),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Expanded(child: _ProjectTextField(hintText: '')),
                          SizedBox(width: 10),
                          Expanded(child: _ProjectTextField(hintText: '')),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE2E8EE)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _SectionLabel('Project Type'),
                            const SizedBox(height: 8),
                            _DropdownField<String>(
                              value: _projectType,
                              items: const [
                                'Apartment Building',
                                'Commercial Tower',
                                'Villa Complex',
                              ],
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() => _projectType = value);
                              },
                            ),
                            const SizedBox(height: 12),
                            const _SectionLabel('Number of Floors'),
                            const SizedBox(height: 8),
                            const _ProjectTextField(hintText: 'e.g. 5'),
                            const SizedBox(height: 12),
                            const _SectionLabel('Rooms per Floor'),
                            const SizedBox(height: 8),
                            const _ProjectTextField(hintText: 'e.g. 20'),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(child: _SectionLabel('Budget')),
                                Transform.scale(
                                  scale: 0.85,
                                  child: Switch(
                                    value: _budgetEnabled,
                                    onChanged: (value) {
                                      setState(() => _budgetEnabled = value);
                                    },
                                    activeThumbColor: Colors.white,
                                    activeTrackColor: const Color(0xFF2A5977),
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFFD6DEE6),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            _ProjectTextField(
                              hintText: '0.00',
                              enabled: _budgetEnabled,
                            ),
                            const SizedBox(height: 12),
                            const _SectionLabel('Location'),
                            const SizedBox(height: 8),
                            const _ProjectTextField(
                              hintText: 'Project location',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const _SectionLabel('Description'),
                      const SizedBox(height: 8),
                      const _ProjectTextField(
                        hintText: 'Describe your product...',
                        maxLines: 4,
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(54),
                            backgroundColor: const Color(0xFF2A5977),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(widget.submitLabel),
                        ),
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

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: const Color(0xFF222222),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _ProjectTextField extends StatelessWidget {
  const _ProjectTextField({
    required this.hintText,
    this.maxLines = 1,
    this.enabled = true,
  });

  final String hintText;
  final int maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFD0D0D0),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: enabled ? Colors.white : const Color(0xFFF3F6F8),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: maxLines > 1 ? 16 : 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE1E7ED)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE1E7ED)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF2A5977)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE1E7ED)),
        ),
      ),
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  const _DropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      onChanged: onChanged,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xFF444444),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE1E7ED)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE1E7ED)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF2A5977)),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(
                '$item',
                style: const TextStyle(color: Color(0xFF444444), fontSize: 16),
              ),
            ),
          )
          .toList(),
    );
  }
}
