import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';

class OwnProfilePage extends StatelessWidget {
  const OwnProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnNavigatorAppBar('Own Profile'),
    );
  }
}