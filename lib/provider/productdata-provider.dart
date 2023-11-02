import 'package:flutter/cupertino.dart';

import '../model/product.dart';

class ProductDataProvider with ChangeNotifier {
  List<Product> _products = <Product>[];
  List<Product> get products => List.unmodifiable(_products);

  void _addNewProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void _deleteProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  List<Product> getProductsByCategory(int categoryNum) {
    List<Product> categoryList = <Product>[];

    for (Product product in _products) {
      if (product.category == categoryNum) {
        categoryList.add(product);
      }
    }

    return categoryList;
  }
}