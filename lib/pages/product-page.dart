import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/provider/cart-provider.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../model/product.dart';

class ProductPage extends StatefulWidget {
  Product product;

  ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int? amount = 1; //default

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
                  widget.product.image,
                  cacheWidth: 300,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Text(
                widget.product.name,
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
                '${widget.product.price} €',
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
                widget.product.description,
                colorClickableText: const Color.fromARGB(255, 130, 93, 247),
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
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cartProvider.addToCart(widget.product, amount!);
                        amount = 1;
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(110, 5, 110, 5),
                        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Icon(CupertinoIcons.shopping_cart),
                    ),
                    DropdownButton<int>(
                      value: amount,
                      onChanged: (int? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          amount = value!;
                        });
                      },
                      items: [1,2,3,4,5,6,7,8,9,10].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}