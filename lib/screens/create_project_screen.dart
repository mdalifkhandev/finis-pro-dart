import 'package:flutter/material.dart';
import '../widgets/project/create_project_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Column(
            children: [
              AppScreenHeader(title: widget.title),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProjectFormSectionLabel('Project Name'),
                      const SizedBox(height: 8),
                      const ProjectTextField(hintText: 'Enter project name'),
                      const SizedBox(height: 14),
                      const ProjectFormSectionLabel('Company'),
                      const SizedBox(height: 8),
                      ProjectDropdownField<String>(
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
                          Expanded(child: ProjectFormSectionLabel('Start Date')),
                          SizedBox(width: 10),
                          Expanded(child: ProjectFormSectionLabel('End Date')),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Expanded(child: ProjectTextField(hintText: '')),
                          SizedBox(width: 10),
                          Expanded(child: ProjectTextField(hintText: '')),
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
                            const ProjectFormSectionLabel('Project Type'),
                            const SizedBox(height: 8),
                            ProjectDropdownField<String>(
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
                            const ProjectFormSectionLabel('Number of Floors'),
                            const SizedBox(height: 8),
                            const ProjectTextField(hintText: 'e.g. 5'),
                            const SizedBox(height: 12),
                            const ProjectFormSectionLabel('Rooms per Floor'),
                            const SizedBox(height: 8),
                            const ProjectTextField(hintText: 'e.g. 20'),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(
                                  child: ProjectFormSectionLabel('Budget'),
                                ),
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
                            ProjectTextField(
                              hintText: '0.00',
                              enabled: _budgetEnabled,
                            ),
                            const SizedBox(height: 12),
                            const ProjectFormSectionLabel('Location'),
                            const SizedBox(height: 8),
                            const ProjectTextField(
                              hintText: 'Project location',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const ProjectFormSectionLabel('Description'),
                      const SizedBox(height: 8),
                      const ProjectTextField(
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
