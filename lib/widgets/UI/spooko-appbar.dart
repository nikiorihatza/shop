import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar returnSpookoAppBar() {
  return AppBar(
    title: Image.asset('lib/assets/logo.jpeg', fit: BoxFit.cover, height: 50),
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    shadowColor: Colors.transparent,
  );
}

AppBar returnNavigatorAppBar() {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    shadowColor: Colors.transparent,
  );
}
