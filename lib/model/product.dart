import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      producer: json['producer'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      storage: json['storage'],
      color: json['color'],
      rating: json['rating'],
      category: json['category'],
      favorited: json['favorited'],
      inStock: json['inStock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'producer': producer,
      'price': price,
      'description': description,
      'image': image,
      'storage': storage,
      'color': color,
      'rating': rating,
      'category': category,
      'favorited': favorited,
      'inStock': inStock,
    };
  }

  static Future<List<Product>> fetchProducts() async {
    final String productsJson = await rootBundle.loadString('lib/assets/products/products.json');
    final List<dynamic> productsList = json.decode(productsJson);

    return productsList.map((product) => Product.fromJson(product)).toList();
  }

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