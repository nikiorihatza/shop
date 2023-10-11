import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/provider/cart-provider.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../model/product.dart';

class ProductPage extends StatelessWidget {
  Product product;

  ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);

    return Scaffold(
      appBar: returnNavigatorAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffffffff)),
                child: Image.asset(
                  product.image,
                  cacheWidth: 300,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text(
                product.price.toString() + ' €',
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: ReadMoreText(
                product.description,
                colorClickableText: Color.fromARGB(255, 130, 93, 247),
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 70,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                  onPressed: () {
                    cartProvider.addToCart(product);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 38, 38, 38),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  child: const Icon(
                    CupertinoIcons.shopping_cart
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
