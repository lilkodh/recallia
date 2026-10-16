import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/onboarding/presentation/screens/onboarding_screen.dart';


void main() {
  runApp(const ProviderScope(child: RecalliaApp()));
}

class RecalliaApp extends StatelessWidget {
  const RecalliaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recallia',
      home: OnboardingScreen(onContinue: () {}),
    );
  }
}
