import 'package:flutter/material.dart';

import '../screens/onboarding_flow_screen.dart';

class FlaterApp extends StatelessWidget {
  const FlaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF285A78),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flater',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF2F5F9),
        textTheme: Typography.blackMountainView,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF7F9FC),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD7DEE7)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF285A78), width: 1.3),
          ),
          hintStyle: const TextStyle(color: Color(0xFF8A95A5)),
        ),
      ),
      home: const OnboardingFlowScreen(),
    );
  }
}
