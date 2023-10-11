import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/functions/routes.dart';

import '../model/product-phone.dart';
import '../model/product.dart';

class RecommendedProductWidget extends StatelessWidget {
  ProductPhone randomProduct1 = ProductPhone(
      id: 1001,
      name: 'IPhone 14 Pro',
      baseprice: 1299.00,
      description: 'The iPhone 14 PRO is the latest iteration of '
      'Apples popular smartphone lineup. It features a 6.1-inch Super Retina XDR'
      ' display that delivers stunning visuals and true-to-life colors. It provides '
          'ample space to store all your photos, '
      'videos, and apps. \n \n Under the hood, the iPhone 14 PRO is powered by the A15 '
      'Bionic chip, which delivers lightning-fast performance and improved '
      'energy efficiency. This allows you to run multiple apps simultaneously '
      'and enjoy smooth, lag-free performance even with the most demanding apps.'
      ' \n \n The iPhone 14 PRO boasts an impressive dual-camera system that lets you '
      'capture stunning photos and videos. The 12MP ultra-wide and wide lenses work '
      'together to deliver sharp, detailed images with excellent color accuracy. '
      'The device also supports Night mode and Deep Fusion, which allows you to capture '
      'stunning low-light photos and crisp details in challenging lighting conditions. '
      '\n \n The iPhone 14 PRO runs on iOS 15, which brings a host of new features and '
      'improvements to the operating system. You can take advantage of features '
      'like Face ID, which allows you to unlock your device with a glance, and '
      'Apple Pay, which lets you make secure payments with just a tap. \n \n'
      'Overall, the iPhone 14 PRO is a powerful and versatile device that offers '
      'top-of-the-line performance and a wide range of features that are sure to'
      ' satisfy even the most demanding users.',
      image: 'lib/assets/products/iphone-14-productimg.jpg',
      prices: [1299.00, 1429.00, 1689.00, 1949.00],
      colorVariations: {
        'darkpurple':const Color.fromARGB(255, 104, 94, 112),
        'gold':const Color.fromARGB(255, 243, 233, 206),
        'silver':Colors.white,
        'space black':Colors.black26
      },
      storageVariations: [128, 256, 512, 1026],
      rating: 4,
      category: 2,
      favorited: false);

  ProductPhone randomProduct2 = ProductPhone(
      id: 1002,
      name: 'IPhone 13',
      baseprice: 699.99,
      description: 'The iPhone 13 is the latest iteration of '
          'Apples popular smartphone lineup. It features a 6.1-inch Super Retina XDR'
          ' display that delivers stunning visuals and true-to-life colors. With '
          '128GB of storage, it provides ample space to store all your photos, '
          'videos, and apps. \n Under the hood, the iPhone 13 is powered by the A15 '
          'Bionic chip, which delivers lightning-fast performance and improved '
          'energy efficiency. This allows you to run multiple apps simultaneously '
          'and enjoy smooth, lag-free performance even with the most demanding apps.'
          ' \n The iPhone 13 boasts an impressive dual-camera system that lets you '
          'capture stunning photos and videos. The 12MP ultra-wide and wide lenses work '
          'together to deliver sharp, detailed images with excellent color accuracy. '
          'The device also supports Night mode and Deep Fusion, which allows you to capture '
          'stunning low-light photos and crisp details in challenging lighting conditions. '
          '\n The iPhone 13 runs on iOS 15, which brings a host of new features and '
          'improvements to the operating system. You can take advantage of features '
          'like Face ID, which allows you to unlock your device with a glance, and '
          'Apple Pay, which lets you make secure payments with just a tap. \n '
          'Overall, the iPhone 13 is a powerful and versatile device that offers '
          'top-of-the-line performance and a wide range of features that are sure to'
          ' satisfy even the most demanding users.',
      image: 'lib/assets/products/iPhone-13-productimg.jpg',
      prices: [899, 1019, 1249],
      storageVariations: [128, 256, 512],
      colorVariations: {
        'blue':const Color.fromARGB(255, 66, 119, 144),
        'rose':const Color.fromARGB(255, 251, 225, 221),
        'midnight':const Color.fromARGB(255, 65, 71, 76),
        'polarstar':Colors.white,
        'green':const Color.fromARGB(255, 69, 86, 67) ,
        'product red':const Color.fromARGB(255, 199, 35, 52)
      },
      rating: 4,
      category: 2,
      favorited: false
  );


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
    products.add(randomProduct1.toProduct());
    products.add(randomProduct2.toProduct());

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
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(createRouteToProduct(randomProduct));
          },
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