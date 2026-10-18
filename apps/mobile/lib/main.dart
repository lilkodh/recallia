import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/navigation/presentation/screens/main_navigation_screen.dart';


void main() {
  runApp(const ProviderScope(child: RecalliaApp()));
}

class RecalliaApp extends StatelessWidget {
  const RecalliaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recallia',
      home: const MainNavigationScreen(),
    );
  }
}
