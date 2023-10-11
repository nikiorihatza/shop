import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_shop/pages/product-page.dart';
import 'package:pos_4ahif_shop/pages/profile-pages/favorites-page.dart';
import 'package:pos_4ahif_shop/pages/profile-pages/myorders-page.dart';
import 'package:pos_4ahif_shop/pages/profile-pages/ownprofile-page.dart';
import 'package:pos_4ahif_shop/pages/profile-pages/settingspage.dart';
import 'package:pos_4ahif_shop/pages/profile-pages/support-page.dart';

import '../model/product.dart';

Route createRouteToFavorites() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FavoritesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route createRouteToMyOrders() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyOrdersPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route createRouteToSupport() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SupportPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route createRouteToSettings() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SettingsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route createRouteToOwnProfile() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const OwnProfilePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route createRouteToProduct(Product product) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProductPage(product: product),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}