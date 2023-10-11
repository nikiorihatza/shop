import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_4ahif_shop/functions/map-functions.dart';
import 'package:pos_4ahif_shop/functions/routes.dart';
import 'package:pos_4ahif_shop/provider/cart-provider.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class CartList extends StatelessWidget {
  CartList({super.key});

  static double totalprice = 0;

  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider = Provider.of<CartProvider>(context, listen: true);
    Map<Product,int> shoppingCart = shoppingCartProvider.cart;

    if (shoppingCart.isEmpty) {
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
        itemCount: shoppingCart.length,
        itemBuilder: (BuildContext context, int index) {
          totalprice += shoppingCart.keys.elementAt(index).price;
          return Card(
            child: CartProductWidget(product: shoppingCart.keys.elementAt(index), amount: shoppingCart.values.elementAt(index))
          );
        },
      ),
    );
  }
}

class CartProductWidget extends StatelessWidget {
  Product product;
  int amount;

  CartProductWidget({super.key, required this.product, required this.amount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(createRouteToProduct(product));
      },
      leading: Image.asset(product.image),
      title: Text(product.name),
      trailing: Text((product.price * amount).toString()),
    );
  }
}