import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/ingestion/presentation/screens/ingestion_test_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RecalliaApp(),
    ),
  );
}

class RecalliaApp extends StatelessWidget {
  const RecalliaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recallia',
      home: const IngestionTestScreen(),
    );
  }
}