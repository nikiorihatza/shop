import 'dart:ui';

class Product {

  int id;
  String name;
  String producer;
  double price;
  String description;
  String image;
  String storage;
  String color;
  int rating;
  int category;
  bool favorited;
  int inStock;

  Product({
    required this.id,
    required this.name,
    required this.producer,
    required this.price,
    required this.description,
    required this.image,
    required this.storage,
    required this.color,
    required this.rating,
    required this.category,
    required this.favorited,
    required this.inStock
  });

  bool equals(Product product) {
    if (this.id == product.id && this.color == product.color) {
      return true;
    }
      return false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}