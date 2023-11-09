import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../widgets/UI/spooko-appbar.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final List<Product> favoriteProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnNavigatorAppBar('Favorites'),
    );
  }
}