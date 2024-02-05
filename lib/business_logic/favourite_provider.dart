import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/models/favourite_model.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List<FavouriteModel> favourites = [];
  bool isCoffeeFavourite(String productName) {
    return favourites.any((coffee) => coffee.extraIngredient == productName);
  }

  void toggleFavourite(
      {String title = '',
      String image = '',
      String extra = '',
      double price = 0.0}) {
    for (var category in categories) {
      for (var coffee in category.items!) {
        if (coffee.extraIngredient == extra) {
          coffee.isFavourite = !coffee.isFavourite!;
          if (coffee.isFavourite!) {
            FavouriteModel favouriteItemData = FavouriteModel(
              title: title,
              image: image,
              extraIngredient: extra,
              price: price,
            );
            favourites.add(favouriteItemData);
            debugPrint('added');
          } else {
            favourites
                .removeWhere((favourite) => favourite.extraIngredient == extra);
            debugPrint('removed');
          }
          notifyListeners();
          return;
        }
      }
    }
  }

  removeFavourite(String extraTitle) {
    for (var category in categories) {
      for (var coffee in category.items!) {
        if (coffee.extraIngredient == extraTitle) {
          coffee.isFavourite = !coffee.isFavourite!;
        }
      }
      favourites.removeWhere(
          (favouriteMap) => favouriteMap.extraIngredient == extraTitle);
      notifyListeners();
    }
  }
}
