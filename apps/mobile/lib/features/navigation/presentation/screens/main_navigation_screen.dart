import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/features/navigation/presentation/widgets/floating_tab_bar.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({
    required this.navigationShell,
    super.key,
  });

  
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: navigationShell,
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        child: FloatingTabBar(
          selectedIndex: navigationShell.currentIndex,
          onTabSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          onAddPressed: () => _onAddPressed(context),
        ),
      ),
    );
  }

  void _onAddPressed(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('Add a memory'),
        ),
      ),
    );
  }
}
