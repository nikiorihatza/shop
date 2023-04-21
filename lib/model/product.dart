import 'dart:ui';

class Product {

  int id;
  String name;
  double price;
  String description;
  String image;
  int rating;
  int category;

  Product({required this.id, required this.name, required this.price, required this.description, required this.image, required this.rating, required this.category});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}