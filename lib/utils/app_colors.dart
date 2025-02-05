import 'package:flutter/material.dart';

class AppColors {
  static const Color kBlackColor = Colors.black87;
  static const Color kProductTitleColor = Color.fromARGB(255, 59, 89, 255);
  static const Color kWhiteColor = Colors.white;
  static const Color kFavoriteIconColor = Color.fromARGB(255, 255, 4, 4);

  static const Color kCardColor1 = Color.fromARGB(255, 173, 255, 97);
  static const Color kCardColor2 = Color.fromARGB(255, 204, 255, 253);

  static const Gradient kCardColor = LinearGradient(
    colors: [
      kCardColor1,
      kCardColor2,
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}
