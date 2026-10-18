import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/navigation/app_router.dart';

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
    return MaterialApp.router(
      title: 'Recallia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: appRouter, // Connects the global router configuration
    );
  }
}
