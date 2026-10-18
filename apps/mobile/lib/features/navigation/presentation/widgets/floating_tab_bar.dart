import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class FloatingTabBar extends StatelessWidget {
  const FloatingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onAddPressed,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onAddPressed;

  static const _tabs = [
    _TabItem(label: 'Home', icon: Icons.home_outlined),
    _TabItem(label: 'Memories', icon: Icons.grid_view_rounded),
    _TabItem(label: 'People', icon: Icons.people_outline_rounded),
    _TabItem(label: 'You', icon: Icons.person_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) {
   return Align(
  alignment: Alignment.bottomCenter,
  heightFactor: 1.0,
  child: Container(
    height: 76,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: AppColors.backgroundDark,
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Row(
      children: [
        _buildTab(0),
        _buildTab(1),
        Expanded(
          child: Center(
            child: _buildAddButton(),
          ),
        ),
        _buildTab(2),
        _buildTab(3),
      ],
    ),
  ),
);
  }

  Widget _buildTab(int index) {
    final tab = _tabs[index];
    final isSelected = selectedIndex == index;

    return Expanded(
      child: Semantics(
        button: true,
        selected: isSelected,
        label: tab.label,
        child: InkWell(
          onTap: () => onTabSelected(index),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  tab.icon,
                  size: 23,
                  color: isSelected
                      ? AppColors.textOnDark
                      : AppColors.textOnDark.withValues(alpha: 0.55),
                ),
                const SizedBox(height: 2),
                Text(
                  tab.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 10,
                    color: isSelected
                        ? AppColors.textOnDark
                        : AppColors.textOnDark.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Semantics(
      button: true,
      label: 'Add memory',
      child: Material(
        color: AppColors.surface,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onAddPressed,
          customBorder: const CircleBorder(),
          child: const SizedBox(
            width: 48,
            height: 48,
            child: Icon(
              Icons.add_rounded,
              size: 30,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem {
  const _TabItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}