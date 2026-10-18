import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onAction,
    super.key,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.title.copyWith(
            color: AppColors.primaryText,
          ),
        ),
        TextButton(
          onPressed: onAction,
          child: Text(
            actionLabel,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}