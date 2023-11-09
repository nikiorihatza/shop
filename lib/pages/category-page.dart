import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/provider/productdata-provider.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';
import 'package:pos_4ahif_shop/widgets/productWidget.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';


class CategoryPage extends StatelessWidget {
  String title;
  int categorynum;

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

  CategoryPage({super.key, required this.title, required this.categorynum});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductDataProvider>(context, listen: true);
    List<Product> productsCat = productProvider.getProductsByCategory(categorynum);

    List<String> categoryTitles = ['TVs', 'Smartphones', 'Notebook', 'PC', 'Gaming', 'Sound', 'Accessories'];

    return Scaffold(
      appBar: returnNavigatorAppBar(categoryTitles[categorynum - 1]),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: productsCat.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductWidget(product: productsCat.elementAt(index));
          },
        ),
      ),
    );
  }

}