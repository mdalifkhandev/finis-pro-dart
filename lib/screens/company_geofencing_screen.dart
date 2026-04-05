import 'package:flutter/material.dart';

class CompanyGeofencingScreen extends StatelessWidget {
  const CompanyGeofencingScreen({super.key});

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
                      'Geofencing',
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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: const [
                      _GeofenceHeaderCard(),
                      SizedBox(height: 14),
                      _MapCard(),
                      SizedBox(height: 14),
                      _ZoneConfigurationCard(),
                      SizedBox(height: 14),
                      _LiveTrackerCard(),
                      SizedBox(height: 14),
                      _LocationLogsCard(),
                      SizedBox(height: 14),
                      _ZoneViolationAlertCard(),
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

class _GeofenceHeaderCard extends StatelessWidget {
  const _GeofenceHeaderCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x100B2239),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F5474),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.map_outlined,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Geofencing & Location',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Define project boundaries and monitor\nworker presence',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF74808B),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFC8E7FB),
                foregroundColor: const Color(0xFF123F5C),
                minimumSize: const Size.fromHeight(44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.add, size: 18),
              label: const Text(
                'Add New Zone',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE4EAF0)),
            ),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  'Lakeside Towers',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF555555),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapCard extends StatelessWidget {
  const _MapCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0E0B2239),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xFFF1E7DD),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF7F1EA), Color(0xFFE8DDD1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                const Positioned(
                  left: -20,
                  top: 8,
                  child: _BuildingBlock(
                    width: 110,
                    height: 170,
                    color: Color(0xFFBDE0F6),
                  ),
                ),
                const Positioned(
                  left: 90,
                  top: 42,
                  child: _BuildingBlock(
                    width: 78,
                    height: 150,
                    color: Color(0xFFEADBCF),
                  ),
                ),
                const Positioned(
                  right: 16,
                  top: 18,
                  child: _BuildingBlock(
                    width: 92,
                    height: 145,
                    color: Color(0xFFF0E4D8),
                  ),
                ),
                const Positioned(
                  right: 54,
                  bottom: 78,
                  child: _BuildingBlock(
                    width: 82,
                    height: 128,
                    color: Color(0xFFE9DCCC),
                  ),
                ),
                Positioned(
                  right: 34,
                  bottom: 34,
                  child: Transform.rotate(
                    angle: -0.06,
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF3E88FF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF17B97D),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Map Legend',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF7A8490),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Row(
                          children: [
                            Expanded(
                              child: _LegendDot(
                                color: Color(0xFF6EA0FF),
                                label: 'Active\nZone',
                              ),
                            ),
                            Expanded(
                              child: _LegendDot(
                                color: Color(0xFF2AB45C),
                                label: 'Worker (In\nZone)',
                              ),
                            ),
                            Expanded(
                              child: _LegendDot(
                                color: Color(0xFFE24444),
                                label: 'Worker\n(Outside)',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ZoneConfigurationCard extends StatelessWidget {
  const _ZoneConfigurationCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x100B2239),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zone\nConfiguration',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Defined on 6/10/2025',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF8A939D),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD8F8E4),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'Active\nMonitor',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF3EAB65),
                            fontWeight: FontWeight.w600,
                            height: 1.15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _OutlinedChipButton(
                        label: 'Disable',
                        icon: Icons.visibility_off_outlined,
                        foregroundColor: const Color(0xFF222222),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const _OutlinedChipButton(
                    label: 'Delete',
                    icon: Icons.delete_outline_rounded,
                    foregroundColor: Color(0xFFFF4D4D),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: _MetricTile(title: 'Total Area', value: '45,200 sq.ft'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _MetricTile(title: 'Perimeter', value: '860 ft'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                child: _MetricTile(
                  title: 'Center Point',
                  value: "43.6332° N,\n-79.4186° W",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _MetricTile(
                  title: 'Monitoring Radius',
                  value: 'Precise\nPolygon',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LiveTrackerCard extends StatelessWidget {
  const _LiveTrackerCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFF151A26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.public_rounded,
                size: 16,
                color: Color(0xFF21D35C),
              ),
              const SizedBox(width: 6),
              Text(
                'Live Tracker',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A6539),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Live',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7FF6A7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                'Workers on Site',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFBBC3CF),
                ),
              ),
              const Spacer(),
              Text(
                '12',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Outside Zone',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFBBC3CF),
                ),
              ),
              const Spacer(),
              Text(
                '0',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFFF7D21E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF22D56F),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationLogsCard extends StatelessWidget {
  const _LocationLogsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x100B2239),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.near_me_outlined,
                  size: 17,
                  color: Color(0xFF222222),
                ),
                const SizedBox(width: 6),
                Text(
                  'Location Logs',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF0F3F6)),
          const _LocationLogRow(
            name: 'Carlos Martinez',
            time: '12:30:00 PM',
            coordinates: '43.6333, -79.4187',
            action: 'Tracking',
          ),
          const _LocationLogRow(
            name: 'Carlos Martinez',
            time: '10:00:00 AM',
            coordinates: '43.6335, -79.4188',
            action: 'Tracking',
          ),
          const _LocationLogRow(
            name: 'David Chen',
            time: '8:15:00 AM',
            coordinates: '43.6332, -79.4186',
            action: 'Check In',
          ),
          const _LocationLogRow(
            name: 'Carlos Martinez',
            time: '7:58:00 AM',
            coordinates: '43.6332, -79.4186',
            action: 'Check In',
            isLast: true,
          ),
          TextButton(onPressed: () {}, child: const Text('View Full History')),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

class _ZoneViolationAlertCard extends StatelessWidget {
  const _ZoneViolationAlertCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF0B828), width: 1.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF2C2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  size: 16,
                  color: Color(0xFFF0B828),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zone Violation Alert',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF222222),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Worker Mike Wilson was detected 50m\noutside the designated zone at 09:45 AM.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF68727D),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('View Incident Details'),
          ),
        ],
      ),
    );
  }
}

class _BuildingBlock extends StatelessWidget {
  const _BuildingBlock({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomPaint(painter: _WindowPainter()),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF222222),
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _OutlinedChipButton extends StatelessWidget {
  const _OutlinedChipButton({
    required this.label,
    required this.icon,
    required this.foregroundColor,
  });

  final String label;
  final IconData icon;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE3E8ED)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: foregroundColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF9AA3AD)),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF222222),
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationLogRow extends StatelessWidget {
  const _LocationLogRow({
    required this.name,
    required this.time,
    required this.coordinates,
    required this.action,
    this.isLast = false,
  });

  final String name;
  final String time;
  final String coordinates;
  final String action;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFF0F3F6))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$time  •  $coordinates',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8A939D),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFE2E8EE)),
            ),
            child: Text(
              action,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF222222),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WindowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.48)
      ..strokeWidth = 1;

    final columns = 5;
    final rows = 9;

    for (var i = 1; i < columns; i++) {
      final x = (size.width / columns) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }

    for (var i = 1; i < rows; i++) {
      final y = (size.height / rows) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
