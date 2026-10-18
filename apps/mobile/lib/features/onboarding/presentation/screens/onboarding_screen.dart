import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/theme/app_text_styles.dart';

import '../../../../core/widgets/app_page_indicator.dart';
import '../widgets/calendar_illustration.dart';
import '../widgets/memory_search_illustration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onContinue();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // PAGE 1: Remember what matters.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),

                        Text(
                          'Remember\nwhat matters.',
                          style: AppTextStyles.headline.copyWith(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          'Photos, videos, places and people — '
                          'connected into your story.',
                          style: AppTextStyles.caption,
                        ),

                        const SizedBox(height: 10),

                        const CalendarIllustration(),
                      ],
                    ),

                    // PAGE 2: Connected memories.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 35),

                        // Empty space for the connection widget.
                        Image.asset(
                          'assets/images/network.png',
                          width: 400,
                          height: 400,
                          fit: BoxFit.contain,
                        ),

                        const Spacer(),

                        Text(
                          'Your life,\nbeautifully connected.',
                          style: AppTextStyles.headline.copyWith(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            height: 1.05,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'People, places, moments and memories '
                          'become connected over time.',
                          style: AppTextStyles.caption,
                        ),

                        const SizedBox(height: 70),
                      ],
                    ),

                    // PAGE 3: Find anything you forgot.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),

                        // Empty space for the photo illustration.
                        const MemorySearchIllustration(),
                        const Spacer(),

                        Text(
                          'Find anything\nyou forgot.',
                          style: AppTextStyles.headline.copyWith(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            height: 1.05,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Search by dates, places, faces, voice notes '
                          'or natural questions in your own words.',
                          style: AppTextStyles.caption,
                        ),

                        const SizedBox(height: 70),
                      ],
                    ),
                  ],
                ),
              ),

              // Bottom controls shared by all three pages.
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppPageIndicator(currentPage: _currentPage, pageCount: 3),

                    IconButton(
                      onPressed: _nextPage,
                      icon: const Icon(Icons.arrow_forward),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.backgroundDark,
                        foregroundColor: AppColors.surface,
                        fixedSize: const Size(56, 56),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
