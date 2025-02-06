import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_shop/data/product_data.dart';
import 'package:simple_flutter_shop/helpers/app_helper.dart';
import 'package:simple_flutter_shop/models/product_model.dart';
import 'package:simple_flutter_shop/pages/cart_page.dart';
import 'package:simple_flutter_shop/pages/favorite_page.dart';
import 'package:simple_flutter_shop/providers/cart_provider.dart';
import 'package:simple_flutter_shop/utils/app_colors.dart';
import 'package:simple_flutter_shop/utils/app_constants.dart';
import 'package:simple_flutter_shop/utils/app_text_style.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = ProductData().products;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kCardColor1,
        leading: Icon(
          Icons.shopify_sharp,
          size: 50,
          color: AppColors.kWhiteColor,
        ),
        title: Text(
          "Flutter Product Shop",
          style: AppTextStyle.mainTitle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.shopify_sharp,
            color: AppColors.kCardColor1,
            size: 50,
          ),
          SizedBox(
            width: AppConstants.kSizedBoxValue - 10,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.kCardColor1,
            heroTag: "fav_page",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(),
                ),
              );
            },
            child: Icon(
              Icons.favorite,
              color: AppColors.kFavoriteIconColor,
              size: 30,
            ),
          ),
          SizedBox(
            width: AppConstants.kSizedBoxValue,
          ),
          FloatingActionButton(
            backgroundColor: AppColors.kCardColor1,
            heroTag: "cart_page",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
              color: AppColors.kProductTitleColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppConstants.kDefualtPadding,
          right: AppConstants.kDefualtPadding,
          bottom: AppConstants.kDefualtPadding * 7.5,
        ),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final ProductModel product = products[index];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    gradient: AppColors.kCardColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kCardColor2,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ]),
                child: Consumer<CartProvider>(
                  builder: (BuildContext context, CartProvider cartProvider,
                      Widget? child) {
                    return ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              product.title,
                              style: AppTextStyle.kProductTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            cartProvider.items.containsKey(product.id)
                                ? cartProvider.items[product.id]!.quantity
                                    .toString()
                                : "0",
                            style: AppTextStyle.kProductPrice.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "LKR.${product.price.toStringAsFixed(2)}",
                        style: AppTextStyle.kProductPrice,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              cartProvider.addItem(
                                product.id,
                                product.price,
                                product.title,
                              );
                              AppHelper.showSnackBar(
                                  context, "Item Added to Cart Successfully!");
                            },
                            icon: cartProvider.items.containsKey(product.id)
                                ? Icon(
                                    Icons.shopping_cart_rounded,
                                    size: 26,
                                    color: AppColors.kFavoriteIconColor,
                                  )
                                : Icon(
                                    Icons.add_shopping_cart_rounded,
                                    size: 26,
                                    color: AppColors.kProductTitleColor,
                                  ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              size: 26,
                              color: AppColors.kFavoriteIconColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
