import 'package:pos_4ahif_shop/model/product.dart';
import 'order-status.dart';

class Order {
  int id;
  DateTime date;
  String deliveryAddress;
  String receiptAddress;
  Map<Product, int> boughtProducts;
  OrderStatus status;

  Order({
    required this.id,
    required this.date,
    required this.deliveryAddress,
    required this.receiptAddress,
    required this.boughtProducts,
    required this.status,
  });

  void setStatus(OrderStatus orderStatus) {
    this.status = orderStatus;
  }
}
