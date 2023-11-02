import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_4ahif_shop/model/product.dart';

class CartProvider with ChangeNotifier {
  Map<Product, int> _cart = {};
  Map<Product, int> get cart => Map.unmodifiable(_cart);

  void addToCart(Product product, int amount) {
    if (_cart.containsKey(product)) {
      _cart.update(product, (value) => _cart[product]! + amount);
    } else {
      _cart[product] = 1;
    }

    notifyListeners();
  }

  void deleteFromCart(product) {
    _cart.remove(product);
    notifyListeners();
  }

  void order() {
    _cart.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    cart.forEach((product, quantity) {
      double productPrice = product.price;
      totalPrice += productPrice * quantity;
    });

    return totalPrice;
  }
}