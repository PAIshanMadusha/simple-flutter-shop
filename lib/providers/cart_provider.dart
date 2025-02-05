import 'package:flutter/material.dart';
import 'package:simple_flutter_shop/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  //Cart Item State
  final Map<String, CartModel> _items = {};

  //Getter
  Map<String, CartModel> get items {
    return {..._items};
  }

  //Add a Item
  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartModel(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  //Remove from cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  //Remove single item form cart
  void removeSingleItem(String productId) {
    if (!items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }
}
