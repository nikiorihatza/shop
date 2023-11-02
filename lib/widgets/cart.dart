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
            height: 350
          )
        ],
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: shoppingCart.length,
        itemBuilder: (BuildContext context, int index) {
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
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Quantity: ${amount}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Subtotal: \$${(product.price * amount).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}