import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';
import 'package:mobile/core/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({required this.onContinue, super.key});
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 54),

              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image.asset(
                      'assets/images/recallia-logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Recallia',
                    style: AppTextStyles.headline.copyWith(
                      color: AppColors.textOnDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Remember what matters.',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textOnDark.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),

              const Spacer(),
              Column(
                children: [
                  AppButton(
                    label: "Let's go remembering",
                    onPressed: onContinue,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Your life, beautifully organized.',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textOnDark.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
