import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/widgets/cart.dart';

class CartPage extends StatelessWidget {
  String title = "CART";

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 50,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: ElevatedButton(
                onPressed: () {},
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
