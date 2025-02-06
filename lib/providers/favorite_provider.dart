import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{

  //State
  final Map<String, bool> _favorites = {};

  //Getter
  Map<String, bool> get favorites => _favorites;

  //Toggle
  void toggleFavorite(String productId){
    if(_favorites.containsKey(productId)){
      _favorites[productId] = !_favorites[productId]!;
    }else{
      _favorites[productId] = true;
    }
    notifyListeners();
  }

  //Check weather Fav or Not
  bool isFavorite(String productId){
    return _favorites[productId] ?? false;
  }

}