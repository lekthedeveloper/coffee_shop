import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/delivery.dart';
import 'package:coffee_shop/screens/details_screen.dart';
import 'package:coffee_shop/screens/favourite_screen.dart';
import 'package:coffee_shop/screens/notification_screen.dart';
import 'package:coffee_shop/screens/order_screen.dart';
import 'package:coffee_shop/screens/realtime_search.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String homepage = '/';
  static const String loginPage = '/loginPage';
  static const String detailsScreen = '/details';
  static const String orderScreen = '/order';
  static const String deliveryScreen = '/delivery';
  static const String cartScreen = '/cart';
  static const String favouriteScreen = '/favourite';
  static const String notificationScreen = '/notification';
  static const String coffeeSearch = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case detailsScreen:
        return MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  title: valuePassed['title'],
                  image: valuePassed['image'],
                  extra: valuePassed['extra'],
                  isFavourite: valuePassed['isFavourite'],
                  description: valuePassed['description'],
                  price: valuePassed['price'],
                  rating: valuePassed['rating'],
                ));

      case orderScreen:
        return MaterialPageRoute(builder: (context) => const OrderScreen());
      case deliveryScreen:
        return MaterialPageRoute(builder: (context) => const DeliveryScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (context) => const CartPage());
      case favouriteScreen:
        return MaterialPageRoute(builder: (context) => const FavourtieScreen());
      case notificationScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case coffeeSearch:
        return MaterialPageRoute(builder: (context) => const CoffeePage());

      default:
        throw const FormatException('you have not added this route yet');
    }
  }
}
