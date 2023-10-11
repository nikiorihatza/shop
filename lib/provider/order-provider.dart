import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_shop/model/order.dart';

import '../model/order-status.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _order = <Order>[];

  List<Order> get order => List.unmodifiable(_order);

  void addNewOrder(Order order) {
    _order.add(order);
    notifyListeners();
  }

  void deleteNewOrder(Order order) {
    _order.remove(order);
    notifyListeners();
  }

  void nextStatus(Order order, OrderStatus status) {
    _order.remove(order);
    order.setStatus(status);
    _order.add(order);
    notifyListeners();
  }
}