import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_shop/helpers/app_helper.dart';
import 'package:simple_flutter_shop/models/cart_model.dart';
import 'package:simple_flutter_shop/providers/cart_provider.dart';
import 'package:simple_flutter_shop/utils/app_colors.dart';
import 'package:simple_flutter_shop/utils/app_constants.dart';
import 'package:simple_flutter_shop/utils/app_text_style.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          "Cart Page",
          style: AppTextStyle.mainTitle,
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder:
            (BuildContext context, CartProvider cartProvider, Widget? child) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppConstants.kDefualtPadding,
              right: AppConstants.kDefualtPadding,
              bottom: AppConstants.kDefualtPadding,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final CartModel cartItem =
                          cartProvider.items.values.toList()[index];
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            gradient: AppColors.kCartCardColor,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    // ignore: deprecated_member_use
                                    AppColors.kCartCardColor1.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              cartItem.title,
                              style: AppTextStyle.kProductTitle,
                            ),
                            subtitle: Column(
                              children: [
                                Text(
                                  cartItem.id,
                                  style: AppTextStyle.kProductPrice,
                                ),
                                Text(
                                  "LKR. ${cartItem.price} X ${cartItem.quantity}",
                                  style: AppTextStyle.kProductPrice,
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartProvider.removeSingleItem(cartItem.id);
                                    AppHelper.showSnackBar(context, "Item Removed Successfully!");
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 26,
                                    color: AppColors.kFavoriteIconColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartProvider.removeItem(cartItem.id);
                                    AppHelper.showSnackBar(context, "Item Removed Successfully!");
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 26,
                                    color: AppColors.kFavoriteIconColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
