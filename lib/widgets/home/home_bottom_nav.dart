import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key, this.currentIndex = 0, this.onTap});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_filled, 'Home'),
      (Icons.apartment_outlined, 'Company'),
      (Icons.chat_bubble_outline, 'Chat'),
      (Icons.calendar_month_outlined, 'Payroll'),
      (Icons.inventory_2_outlined, 'Inventory'),
    ];

    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF183B56).withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: onTap == null ? null : () => onTap!(i),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[i].$1,
                      size: 20,
                      color: i == currentIndex
                          ? const Color(0xFF2A5977)
                          : const Color(0xFF6A7280),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].$2,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: i == currentIndex
                            ? const Color(0xFF2A5977)
                            : const Color(0xFF6A7280),
                        fontWeight: i == currentIndex
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
