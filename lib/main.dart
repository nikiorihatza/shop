import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pos_4ahif_shop/pages/cart-page.dart';
import 'package:pos_4ahif_shop/pages/home-page.dart';
import 'package:pos_4ahif_shop/pages/login-page.dart';
import 'package:pos_4ahif_shop/pages/profile-page.dart';
import 'package:pos_4ahif_shop/pages/search-page.dart';
import 'package:pos_4ahif_shop/provider/cart-provider.dart';
import 'package:pos_4ahif_shop/provider/order-provider.dart';
import 'package:pos_4ahif_shop/provider/productdata-provider.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
        ChangeNotifierProvider<ProductDataProvider>(create: (_) => ProductDataProvider())
      ],
      child: MaterialApp(
        title: 'Spooko',
        theme: ThemeData(
          backgroundColor: Colors.white
        ),
        home: MyHomePage(title: 'Home - Spooko', loggedIn: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  bool loggedIn;

  MyHomePage({super.key, required this.title, required this.loggedIn});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loggedIn = true;

  final _pages = <Widget>[
    HomePage(),
    CartPage(),
    SearchPage(),
    ProfilePage()
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (loggedIn == false) {
      return LoginPage();
    }
    return Scaffold(
      appBar: returnSpookoAppBar(),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: GNav(
          gap: 8,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: CupertinoIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: CupertinoIcons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: CupertinoIcons.person,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
