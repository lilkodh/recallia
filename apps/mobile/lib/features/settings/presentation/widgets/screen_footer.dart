import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

class ScreenFooter extends StatelessWidget {
  const ScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your memories stay yours.',
            style: AppTextStyles.title.copyWith(
              color: const Color(0xFF1C1C1C), 
              fontWeight: FontWeight.w800, 
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Local-first. You control what Recallia\ncan access at any time.',
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(
              color: const Color(0xFF707070), 
              fontSize: 12, 
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
