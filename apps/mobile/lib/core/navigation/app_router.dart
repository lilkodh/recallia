import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/memories/presentation/screens/memories_screen.dart';
import 'package:mobile/features/settings/presentation/screens/privacy_data_screen.dart';
import 'package:mobile/features/navigation/presentation/screens/main_navigation_screen.dart';
import 'package:mobile/features/onboarding/presentation/screens/onboarding_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  
  initialLocation: '/onboarding', 
  routes: [
    // 2. Add the standalone Onboarding Route
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(
        onContinue: () {
          context.go('/home');
        },
      ),
    ),
    
    
    StatefulShellRoute.indexedStack(
      builder: (context, state, StatefulNavigationShell navigationShell) {
        return MainNavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/memories',
              builder: (context, state) => const MemoriesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/people',
              builder: (context, state) => const Scaffold(
                body: Center(child: Text('People')),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/privacy',
              builder: (context, state) => const PrivacyDataScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
