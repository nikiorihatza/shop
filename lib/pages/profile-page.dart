import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_4ahif_shop/functions/login-functions.dart';
import 'package:pos_4ahif_shop/functions/routes.dart';
import 'package:pos_4ahif_shop/pages/login-page.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/user-provider.dart';

class ProfilePage extends StatelessWidget {
  String title = "PROFILE";
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.user;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
          ),
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: ListTile(
              leading: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network('https://t3.ftcdn.net/jpg/05/57/20/16/360_F_557201692_P86sh0v8g00VseZacjBOOKJmGLSvEpQb.jpg'),
                ),
              ),
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded
              ),
              onTap: () {
                Navigator.of(context).push(createRouteToOwnProfile());
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            children: [
              Card(
                shadowColor: Colors.grey,
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.heart,
                    color: Color.fromARGB(255, 38, 38, 38),
                  ),
                  title: Text(
                      'FAVORITES'
                  ),
                  onTap: () {
                    Navigator.of(context).push(createRouteToFavorites());
                  },
                ),
              ),
              Card(
                shadowColor: Colors.grey,
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.truck,
                    color: Color.fromARGB(255, 38, 38, 38),
                  ),
                  title: Text(
                    'MY ORDERS'
                  ),
                  onTap: () {
                    Navigator.of(context).push(createRouteToMyOrders());
                  },
                ),
              ),
              Card(
                shadowColor: Colors.grey,
                child: ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    color: Color.fromARGB(255, 38, 38, 38),
                  ),
                  title: Text(
                      'SUPPORT'
                  ),
                  onTap: () {
                    Navigator.of(context).push(createRouteToSupport());
                  },
                ),
              ),
              Card(
                shadowColor: Colors.grey,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 38, 38, 38),
                  ),
                  title: Text(
                      'SETTINGS'
                  ),
                  onTap: () {
                    Navigator.of(context).push(createRouteToSettings());
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                userProvider.user = User(id: 0, firstName: '', lastName: '', email: '', password: '', favorites: '', orders: '', currentCart: '');
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent
              ),
              child: const Text(
                'SIGN OUT',
                style: TextStyle(
                    color: Colors.red
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}