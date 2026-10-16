import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  // and this is Editorial headings
  static const String _serifFont = 'Roboto Text';
  static const TextStyle display = TextStyle(
    fontFamily: _serifFont,
    fontSize: 42,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColors.primaryText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: _serifFont,
    fontSize: 50,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.primaryText,
  );

  // this is Screen titles
  static const TextStyle title = TextStyle(
    fontFamily: _serifFont,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.primaryText,
  );

  // this for Supporting text
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.secondaryText,
  );
  // this for the caption
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.secondaryText,
  );

  // this for Actions
  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.primaryText,
  );
}
