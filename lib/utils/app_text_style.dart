import 'package:flutter/material.dart';
import 'package:simple_flutter_shop/utils/app_colors.dart';

class AppTextStyle {

  static const TextStyle mainTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor,
  );

  static const TextStyle kProductTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.kProductTitleColor,
  );

  static const TextStyle kProductPrice = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );
}
