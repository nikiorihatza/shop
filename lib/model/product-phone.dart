import 'dart:ui';

import 'package:pos_4ahif_shop/model/product.dart';

class ProductPhone {

  int id;
  String name;
  String producer;
  double baseprice;
  String description;
  String image;
  List<int> storageVariations;
  Map<String, Color> colorVariations;
  List<double> prices;
  int rating;
  int category;
  bool favorited;
  int inStock;

  ProductPhone({
    required this.id,
    required this.name,
    required this.producer,
    required this.baseprice,
    required this.description,
    required this.image,
    required this.storageVariations,
    required this.colorVariations,
    required this.prices,
    required this.rating,
    required this.category,
    required this.favorited,
    required this.inStock,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductPhone && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Product toProduct() {
    return Product(
        id: id,
        name: name,
        producer: producer,
        price: baseprice,
        description: description,
        image: image,
        storage: '',
        color: '',
        rating: rating,
        category: category,
        favorited: favorited,
        inStock: inStock
    );
  }
}