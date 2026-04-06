import 'package:flutter/material.dart';

class AppScreenHeader extends StatelessWidget {
  const AppScreenHeader({
    super.key,
    required this.title,
    this.onBack,
    this.titleStyle,
  });

  final String title;
  final VoidCallback? onBack;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onBack ?? () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              visualDensity: VisualDensity.compact,
            ),
          ),
          Text(
            title,
            style:
                titleStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF222222),
                ),
          ),
        ],
      ),
    );
  }
}
