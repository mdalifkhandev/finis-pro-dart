import 'package:flutter/material.dart';
import '../widgets/project/floor_room_setup_widgets.dart';
import '../widgets/shared/app_screen_header.dart';

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
              const AppScreenHeader(title: 'Floor & Room Setup'),
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
                    onPressed: () => showAddFloorSheet(context),
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
                      FloorCard(
                        statusLabel: 'Completed',
                        statusColor: Color(0xFF46C26F),
                      ),
                      SizedBox(height: 12),
                      FloorCard(
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
