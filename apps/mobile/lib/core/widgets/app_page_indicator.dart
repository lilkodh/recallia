import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppPageIndicator extends StatelessWidget {
  const AppPageIndicator({
    required this.currentPage,
    required this.pageCount,
    super.key,
  }) : assert(currentPage > 0),
       assert(currentPage >= 0 && currentPage < pageCount);

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 6,
          height: 6,

          decoration: BoxDecoration(
            color: isActive ? AppColors.accent : AppColors.indicatorInactive,
            borderRadius: BorderRadius.circular(99),
          ),
        );
      }),
    );
  }
}
