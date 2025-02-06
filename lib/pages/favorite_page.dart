import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_shop/data/product_data.dart';
import 'package:simple_flutter_shop/helpers/app_helper.dart';
import 'package:simple_flutter_shop/models/product_model.dart';
import 'package:simple_flutter_shop/providers/favorite_provider.dart';
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
        backgroundColor: AppColors.kCartCardColor1,
        title: Text(
          "Favorite Page",
          style: AppTextStyle.mainTitle,
        ),
        centerTitle: true,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (BuildContext context, FavoriteProvider favoriteProvider,
            Widget? child) {
          final favoriteItems = favoriteProvider.favorites.entries
              .where((entry) => entry.value)
              .map((entry) => entry.key)
              .toList();

          if (favoriteItems.isEmpty) {
            return const Center(
              child: Text(
                "Add Some Favorites!",
                style: AppTextStyle.kProductTitle,
              ),
            );
          }
          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final productId = favoriteItems[index];
              final ProductModel product = ProductData()
                  .products
                  .firstWhere((product) => product.id == productId);

              return Card(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.kCartCardColor,
                  ),
                  child: ListTile(
                    title: Text(
                      product.title,
                      style: AppTextStyle.kProductTitle,
                    ),
                    subtitle: Text(
                      "LKR ${product.price.toStringAsFixed(2)}",
                      style: AppTextStyle.kProductPrice,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        favoriteProvider.toggleFavorite(product.id);
                        AppHelper.showSnackBar(
                            context, "Item Removed Successfully!");
                      },
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.kFavoriteIconColor,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
