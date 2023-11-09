import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';

import '../../model/order.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});

  final List<Order> orderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnNavigatorAppBar('My Orders'),
    );
  }
}

