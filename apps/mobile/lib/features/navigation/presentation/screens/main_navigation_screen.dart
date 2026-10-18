import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/features/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/memories/presentation/screens/memories_screen.dart';
import 'package:mobile/features/navigation/presentation/widgets/floating_tab_bar.dart';
import 'package:mobile/features/settings/presentation/screens/privacy_data_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MemoriesScreen(),
    _PlaceholderScreen(title: 'People'),
    PrivacyDataScreen(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(0, 0, 0, 1),
        child: FloatingTabBar(
          selectedIndex: _selectedIndex,
          onTabSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          onAddPressed: _onAddPressed,
        ),
      ),
    );
  }

  void _onAddPressed() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Text('Add a memory'),
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Text(title),
      ),
    );
  }
}