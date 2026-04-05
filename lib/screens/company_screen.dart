import 'package:flutter/material.dart';

import 'create_company_screen.dart';
import 'company_detail_screen.dart';
import '../widgets/company/company_list_card.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                  Text(
                    'Company',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF222222),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search......',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Color(0xFF8F98A3),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDDE5EC)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDDE5EC)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CompanyListCard(
                    name: 'Summit Construction Ltd.',
                    category: 'Construction',
                    revenue: '\$12121212',
                    projects: 'Intermediate',
                    address: '8502 Preston Rd. Inglewood',
                    website: 'www.Good Boy.com',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const CompanyDetailScreen(),
                        ),
                      );
                    },
                  ),
                  CompanyListCard(
                    name: 'Summit Construction Ltd.',
                    category: 'Construction',
                    revenue: '\$12121212',
                    projects: 'Intermediate',
                    address: '8502 Preston Rd. Inglewood',
                    website: 'www.Good Boy.com',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const CompanyDetailScreen(),
                        ),
                      );
                    },
                  ),
                  CompanyListCard(
                    name: 'Summit Construction Ltd.',
                    category: 'Construction',
                    revenue: '\$12121212',
                    projects: 'Intermediate',
                    address: '8502 Preston Rd. Inglewood',
                    website: 'www.Good Boy.com',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const CompanyDetailScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const CreateCompanyScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: const Color(0xFF2A5977),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Create New Company'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
