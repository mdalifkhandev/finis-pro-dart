import 'package:flutter/material.dart';

import '../models/app_role.dart';
import 'company_screen.dart';
import '../widgets/home/dashboard_stat_card.dart';
import '../widgets/home/home_bottom_nav.dart';
import '../widgets/home/invite_member_dialog.dart';
import '../widgets/home/project_progress_card.dart';
import '../widgets/home/worker_site_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.role = AppRole.admin});

  final AppRole role;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Future<void> _showInviteDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const InviteMemberDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _AdminHomeOverview(
        role: widget.role,
        onInvite: () => _showInviteDialog(context),
      ),
      const CompanyScreen(),
      _RolePlaceholderScreen(title: 'Chat', role: widget.role),
      _RolePlaceholderScreen(title: 'Payroll', role: widget.role),
      _RolePlaceholderScreen(title: 'Inventory', role: widget.role),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: pages[_currentIndex],
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _AdminHomeOverview extends StatelessWidget {
  const _AdminHomeOverview({required this.role, required this.onInvite});

  final AppRole role;
  final VoidCallback onInvite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFB6C8D7), Color(0xFFF0F6FB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Icon(Icons.person, color: Color(0xFF2A5977)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF2A5977),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${role.label}!!',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE5F4FC),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Color(0xFF2A5977),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 252,
              child: GridView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.18,
                ),
                children: const [
                  DashboardStatCard(
                    icon: Icons.trending_up_rounded,
                    value: '56',
                    label: 'Active Projects',
                  ),
                  DashboardStatCard(
                    icon: Icons.groups_2_outlined,
                    value: '85',
                    label: 'Active Orders',
                  ),
                  DashboardStatCard(
                    icon: Icons.attach_money_rounded,
                    value: '\$24.5K',
                    label: 'Payroll Pending',
                  ),
                  DashboardStatCard(
                    icon: Icons.warning_amber_rounded,
                    value: '85',
                    label: 'Inventory Alerts',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 86,
                height: 30,
                child: FilledButton.icon(
                  onPressed: onInvite,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2A5977),
                    minimumSize: const Size(86, 30),
                    maximumSize: const Size(86, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.add, size: 13),
                  label: const Text(
                    'Invite',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  'Active Projects',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF2A5977),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'View All',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF2A5977),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const ProjectProgressCard(
              title: 'Riverside Tower',
              status: 'On Track',
              statusColor: Color(0xFF79C37A),
              workers: '15 workers',
              progressText: '75% complete',
              progressValue: 0.45,
            ),
            const ProjectProgressCard(
              title: 'Riverside Tower',
              status: 'Delayed',
              statusColor: Color(0xFFF3A34C),
              workers: '15 workers',
              progressText: '75% complete',
              progressValue: 0.6,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'Workers On Site',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF2A5977),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'View All',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF2A5977),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const WorkerSiteCard(
              name: 'John Smith',
              role: 'Electrician',
              site: 'Riverside Tower',
              status: 'Active',
            ),
            const WorkerSiteCard(
              name: 'John Smith',
              role: 'Electrician',
              site: 'Riverside Tower',
              status: 'Active',
            ),
            const WorkerSiteCard(
              name: 'John Smith',
              role: 'Electrician',
              site: 'Riverside Tower',
              status: 'Active',
            ),
          ],
        ),
      ),
    );
  }
}

class _RolePlaceholderScreen extends StatelessWidget {
  const _RolePlaceholderScreen({required this.title, required this.role});

  final String title;
  final AppRole role;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2A5977),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${role.label} role er jonno $title screen ekhane add hobe.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6A7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
