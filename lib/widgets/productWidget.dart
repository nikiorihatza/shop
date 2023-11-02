import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_shop/pages/product-page.dart';

import '../model/product.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({
    super.key,
    required this.product
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ProductPage(product: widget.product)
            )
          );
        },
        child: Row(
          children: [
            // Product Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.product.producer,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        CupertinoButton(
                          child: Icon(
                            widget.product.favorited
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: widget.product.favorited ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            _toggleFavorite();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.product.favorited = !widget.product.favorited;
    });
  }
}
