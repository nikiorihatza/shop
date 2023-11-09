import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pos_4ahif_shop/pages/profile-page.dart';
import 'package:pos_4ahif_shop/pages/search-page.dart';

import '../widgets/UI/spooko-appbar.dart';
import 'cart-page.dart';
import 'home-page.dart';

class MainView extends StatefulWidget{
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _pages = <Widget>[
    HomePage(),
    CartPage(),
    SearchPage(),
    ProfilePage()
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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