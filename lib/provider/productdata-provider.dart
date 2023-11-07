import 'package:flutter/cupertino.dart';

import '../model/product.dart';

class ProductDataProvider with ChangeNotifier {
  List<Product> _products = [];

  ProductDataProvider() {
    _initializeProducts();
  }

  Future<void> _initializeProducts() async {
    _products = await Product.fetchProducts();
    notifyListeners();

    for (Product product in _products) {
      print('Product Name: ${product.name}');
      print('Producer: ${product.producer}');
      print('Price: \$${product.price.toStringAsFixed(2)}');
      print('---------------------');
    }
  }

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