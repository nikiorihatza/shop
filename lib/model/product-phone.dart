import 'dart:ui';

import 'package:pos_4ahif_shop/model/product.dart';

class ProductPhone {

  int id;
  String name;
  double baseprice;
  String description;
  String image;
  List<int> storageVariations;
  Map<String, Color> colorVariations;
  List<double> prices;
  int rating;
  int category;
  bool favorited;

  ProductPhone({
    required this.id,
    required this.name,
    required this.baseprice,
    required this.description,
    required this.image,
    required this.storageVariations,
    required this.colorVariations,
    required this.prices,
    required this.rating,
    required this.category,
    required this.favorited
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductPhone && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Product toProduct() {
    return Product(
        id: this.id,
        name: this.name,
        price: this.baseprice,
        description: this.description,
        image: this.image,
        storage: '',
        color: '',
        rating: this.rating,
        category: this.category,
        favorited: this.favorited,
        categroisedObject: this
    );
  }
}