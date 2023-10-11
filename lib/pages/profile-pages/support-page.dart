import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/UI/spooko-appbar.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnNavigatorAppBar(),
    );
  }
}