import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_4ahif_shop/functions/map-functions.dart';

import '../model/product.dart';

class CartList extends StatelessWidget {
  Map<Product,int> shoppingCart = Map();
  List<CartProductWidget> widgetProducts = [];

  CartList({super.key});

  @override
  Widget build(BuildContext context) {
    if (widgetProducts.isEmpty) {
      return Column(
        children: <Widget>[
          const Center(
              child: Text('Nothing in cart yet!')
          ),
          Lottie.network(
              'https://assets3.lottiefiles.com/private_files/lf30_aprp5fnm.json',
            height: 500
          )
        ],
      );
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: widgetProducts[index]
          );
        },
      ),
    );
  }

  void addToShoppingCart(Product product) {
    int newAmount = 1;

    if (shoppingCart.containsKey(product)) {
      newAmount += MapFunctions().getValue(shoppingCart, product).toString() as int;
    }

    widgetProducts.add(CartProductWidget(product: product, amount: newAmount));
  }
}

class CartProductWidget extends StatelessWidget {
  Product product;
  int amount;

  CartProductWidget({super.key, required this.product, required this.amount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(product.image),
      title: Text(product.name),
      trailing: Text((product.price * amount).toString()),
    );
  }
}