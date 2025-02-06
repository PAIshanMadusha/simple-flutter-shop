import 'package:flutter/material.dart';
import 'package:simple_flutter_shop/utils/app_colors.dart';
import 'package:simple_flutter_shop/utils/app_text_style.dart';

class AppHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.kProductTitle.copyWith(
            fontSize: 15,
            color: AppColors.kWhiteColor,
          ),
        ),
        duration: Duration(
          seconds: 1,
        ),
      ),
    );
  }
}
