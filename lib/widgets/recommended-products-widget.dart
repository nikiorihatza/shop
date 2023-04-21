import 'dart:math';

import 'package:flutter/material.dart';

import '../model/product.dart';

class RecommendedProductWidget extends StatelessWidget {
  Product randomProduct1 = Product(id: 1001, name: 'IPhone 14 Pro - 256 GB', price: 989.99, description: 'A Phone', image: 'lib/assets/products/iphone-14-productimg.jpg', rating: 4, category: 2);
  Product randomProduct2 = Product(id: 1002, name: 'IPhone 13 - 128 GB', price: 699.99, description: 'A Phone', image: 'lib/assets/products/iPhone-13-productimg.jpg', rating: 4, category: 2);


  List<Product> products = [];
  List<Product> selectedProducts = [];

  /*
  Categories:
    1 -> TVs
    2 -> Smartphones
    3 -> Notebook
    4 -> PC
    5 -> Gaming
    6 -> Sound
    7 -> Accessories
  */

  RecommendedProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    products.add(randomProduct1);
    products.add(randomProduct2);

    var randomProduct = _getRandomProductFromList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            color: const Color(0xff262626)
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffffffff)
                ),
                child: Image.asset(
                  randomProduct.image,
                  cacheWidth: 150,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 12, 0, 0),
                child: Text(
                  randomProduct.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 12, 0, 0),
                child: Text(
                  ('${randomProduct.price}€'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Product _getRandomProductFromList() {
    var randomProduct = products[Random().nextInt(products.length)];

    for (var product in selectedProducts) {
      if (randomProduct == product) {
        return _getRandomProductFromList();
      } else {
        selectedProducts.add(randomProduct);
        return randomProduct;
      }
    }

    return randomProduct;
  }
}