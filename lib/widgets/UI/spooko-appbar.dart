import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar returnSpookoAppBar() {
  return AppBar(
    title: Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
        child: Image.asset(
          'lib/assets/logo.jpeg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    shadowColor: Colors.transparent,
  );
}

AppBar returnNavigatorAppBar(String title) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    title: Text(title),
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    shadowColor: Colors.transparent,
  );
}
