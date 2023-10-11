import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorVariatons extends StatelessWidget {

  Map<String, Color> colors;

  ColorVariatons({required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [

        ],
      ),
    );
  }
}