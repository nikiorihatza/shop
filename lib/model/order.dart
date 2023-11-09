import 'package:pos_4ahif_shop/model/product.dart';
import 'package:pos_4ahif_shop/model/user.dart';
import 'order-status.dart';

class Order {
  int id;
  DateTime date;
  User user;
  String deliveryAddress;
  String receiptAddress;
  Map<Product, int> boughtProducts;
  OrderStatus status;

  Order({
    this.id = 0,
    required this.date,
    required this.user,
    required this.deliveryAddress,
    required this.receiptAddress,
    required this.boughtProducts,
    required this.status,
  });

  void setStatus(OrderStatus orderStatus) {
    this.status = orderStatus;
  }

  void order() {

  }
}
