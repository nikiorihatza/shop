import 'package:flutter/cupertino.dart';

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
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}