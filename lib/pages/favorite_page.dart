import 'package:flutter/material.dart';
import 'package:simple_flutter_shop/utils/app_colors.dart';
import 'package:simple_flutter_shop/utils/app_text_style.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 35,
              color: AppColors.kWhiteColor,
            )),
        backgroundColor: AppColors.kCardColor1,
        title: Text(
          "Favorite Page",
          style: AppTextStyle.mainTitle,
        ),
        centerTitle: true,
      ),
    );
  }
}
