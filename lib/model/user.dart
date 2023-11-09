import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:pos_4ahif_shop/model/product.dart';

import 'order.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String favorites; // IDs of the products seperated by ,
  String orders;
  String currentCart;

  User({
    this.id = 0,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.favorites,
    required this.orders,
    required this.currentCart //null = Tod
  });

  static Future<List<User>> fetchUser() async {
    final String userJson = await rootBundle.loadString('lib/assets/users.json');
    final List<dynamic> usersList = json.decode(userJson);
    return usersList.map((user) => User.fromJson(user)).toList();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastname'],
      email: json['email'].toString(),
      password: json['password'],
      favorites: json['favorites'],
      orders: json['favorites'],
      currentCart: json['favorites'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'favorites': favorites,
      'orders': orders,
      'currentCart': currentCart
    };
  }

  Future<void> register() async {
    try {
      Map<String, dynamic> jsonMap = toJson();
      File jsonFile = File('lib/assets/users.json');
      String content = await rootBundle.loadString('lib/assets/users.json');
      Map<String, dynamic> jsonData = json.decode(content);
      jsonData.addAll(jsonMap);
      String updatedContent = json.encode(jsonData);
      if (kDebugMode) {
        print(updatedContent);
      }
      await jsonFile.writeAsString(updatedContent);
    } catch (e) {
      print('Error in register method: $e');
    }
  }
}
