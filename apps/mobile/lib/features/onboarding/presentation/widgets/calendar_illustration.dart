import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CalendarIllustration extends StatelessWidget {
  const CalendarIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.81,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.textOnDark,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Image.asset('assets/images/calender.png', fit: BoxFit.contain),
      ),
    );
  }
}
