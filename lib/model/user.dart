import 'package:pos_4ahif_shop/model/product.dart';

import 'order.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  List<Product> favorites;
  List<Order> orders;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.favorites,
    required this.orders,
  });
}
