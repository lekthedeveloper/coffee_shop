import 'dart:async';

import 'package:coffee_shop/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartModel> cart = [];
  double deliveryFee = 3.0;
  String getItemName = '';
  bool discountBox = true;
  bool appliedDiscount = false;

  bool itemNotinCartNotification = false;
  bool addToCartNotfication = false;
//function to add new item to cart
  newCartItem(
      {String title = '',
      String extra = '',
      double price = 0.0,
      int quatity = 1,
      String size = '',
      String imageLink = ''}) {
    cart.add(CartModel(
        title: title,
        imageLink: imageLink,
        extra: extra,
        quatity: quatity,
        price: price,
        size: size));
    notifyListeners();
  }

//function to return the title of all items in cart
  get itemName {
    var checker = cart.map((item) => item.extra);
    return checker.toList();
  }

//function to clear cart
  clearCart() {
    cart.clear();
    notifyListeners();
  }

//remove individual item from cart
  removeFromCart(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  increaseQuantityWhere(String orderName, String command) {
    var checker =
        cart.indexWhere((ordertitle) => ordertitle.extra!.contains(orderName));
    if (command == 'increase' && cart.elementAt(checker).quatity <= 3) {
      cart.elementAt(checker).quatity++;
      notifyListeners();
    } else if (command == 'decrease' && cart.elementAt(checker).quatity >= 2) {
      cart.elementAt(checker).quatity--;
      notifyListeners();
    }
  }

  triggerDiscountBox() {
    discountBox = !discountBox;
    appliedDiscount = !appliedDiscount;
    notifyListeners();
  }

  //cart estimate
  get currentCartEstimate {
    var newtotal = 0.0;
    for (var i in cart) {
      newtotal += i.price! * i.quatity;
    }
    return newtotal.toStringAsFixed(2);
  }

  getNewDiscountedDeliveryFee(String condition) {
    if (condition == 'add') {
      deliveryFee = deliveryFee + 2.0;
    } else if (condition == 'sub') {
      deliveryFee = deliveryFee - 2.0;
    }

    notifyListeners();
  }

  get cartEstimate {
    var newtotal = 0.0;
    for (var i in cart) {
      newtotal += i.price! * i.quatity;
    }

    newtotal += deliveryFee;
    return newtotal.toStringAsFixed(2);
  }

  getITemTitle(String title) {
    getItemName = title;
    notifyListeners();
  }

  itemNotinCartAnimation() {
    itemNotinCartNotification = true;
    notifyListeners();
    Timer(const Duration(seconds: 5), () {
      itemNotinCartNotification = false;
      notifyListeners();
    });
  }

  startCartAnimation() {
    addToCartNotfication = true;
    notifyListeners();
    Timer(const Duration(seconds: 5), () {
      addToCartNotfication = false;
      notifyListeners();
    });
  }
}
