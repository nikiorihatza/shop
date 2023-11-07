import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/model/order.dart';
import 'package:pos_4ahif_shop/pages/order-page.dart';
import 'package:pos_4ahif_shop/widgets/cart.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../provider/cart-provider.dart';

class CartPage extends StatelessWidget {
  String title = "CART";

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider = Provider.of<CartProvider>(context, listen: true);
    Map<Product,int> shoppingCart = shoppingCartProvider.cart;
    double totalprice = shoppingCartProvider.getTotalPrice();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CartList(),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(
            children: [
              Text("Total: ${totalprice.toStringAsFixed(2)} €", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )
              )
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 50,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrderPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 38, 38, 38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
