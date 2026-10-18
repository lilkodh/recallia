import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/navigation/presentation/screens/main_navigation_screen.dart';
import 'package:mobile/features/onboarding/presentation/screens/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: RecalliaApp()));
}

class RecalliaApp extends StatefulWidget {
  const RecalliaApp({super.key});

  @override
  State<RecalliaApp> createState() => _RecalliaAppState();
}

class _RecalliaAppState extends State<RecalliaApp> {
  bool _isOnboardingCompleted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recallia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: _isOnboardingCompleted
          ? const MainNavigationScreen()
          : OnboardingScreen(
              onContinue: () {
                setState(() {
                  _isOnboardingCompleted = true;
                });
              },
            ),
    );
  }
}
