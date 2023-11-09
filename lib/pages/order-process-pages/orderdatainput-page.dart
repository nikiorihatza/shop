import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/model/order-status.dart';
import 'package:pos_4ahif_shop/provider/cart-provider.dart';
import 'package:pos_4ahif_shop/provider/user-provider.dart';
import 'package:pos_4ahif_shop/widgets/UI/spooko-appbar.dart';
import 'package:provider/provider.dart';

import '../../model/order.dart';
import '../../model/user.dart';
import '../../provider/order-provider.dart';

class OrderDataInputPage extends StatefulWidget {
  @override
  State<OrderDataInputPage> createState() => _OrderDataInputPageState();
}

class _OrderDataInputPageState extends State<OrderDataInputPage> {
  @override
  Widget build(BuildContext context) {
    final orderFirstNameController = TextEditingController();
    final orderLastNameController = TextEditingController();
    final orderEmailController = TextEditingController();
    final orderDeliveryAddress = TextEditingController();
    final orderRecieptAddress = TextEditingController();

    // Provider
    var userProvider = Provider.of<UserProvider>(context, listen: true);
    var shoppingCartProvider = Provider.of<CartProvider>(context, listen: true);
    var orderProvider = Provider.of<OrderProvider>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset('lib/assets/logo.png', width: 300,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
                    child: TextField(
                      controller: orderFirstNameController,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      decoration: InputDecoration(
                        labelText: 'Firstname',
                        fillColor: Colors.white,
                        labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusColor: const Color.fromARGB(255, 130, 93, 247),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: TextField(
                      controller: orderLastNameController,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Lastname',
                        fillColor: Colors.white,
                        labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusColor: const Color.fromARGB(255, 130, 93, 247),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: TextField(
                      controller: orderEmailController,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.white,
                        labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusColor: const Color.fromARGB(255, 130, 93, 247),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: TextField(
                      controller: orderDeliveryAddress,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Delivery Address',
                        fillColor: Colors.white,
                        labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusColor: const Color.fromARGB(255, 130, 93, 247),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: TextField(
                      controller: orderRecieptAddress,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Reciept Address',
                        fillColor: Colors.white,
                        labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusColor: const Color.fromARGB(255, 130, 93, 247),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.maxFinite,
                            height: 70,
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      minimumSize: Size(double.maxFinite, 50),
                                    ),
                                    child: const Text(
                                      'Back',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10), // Add spacing between the buttons
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: (){
                                      print('Pressed Register');
                                      String firstName = orderFirstNameController.text;
                                      String lastName = orderLastNameController.text;
                                      String email = orderEmailController.text;
                                      String deliveryAddress = orderDeliveryAddress.text;
                                      String recieptAddress = orderRecieptAddress.text;
                                      late User orderUser;

                                      List<User> users = userProvider.users;

                                      for (User user in users) {
                                        if (user.email == email) {
                                          orderUser = user;
                                        }
                                      }

                                      Order order = Order(
                                          date: DateTime.now(),
                                          user: orderUser,
                                          deliveryAddress: deliveryAddress,
                                          receiptAddress: recieptAddress,
                                          boughtProducts: shoppingCartProvider.cart,
                                          status: OrderStatus.placed
                                      );



                                      orderFirstNameController.clear();
                                      orderLastNameController.clear();
                                      orderDeliveryAddress.clear();
                                      orderRecieptAddress.clear();
                                      orderEmailController.clear();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      minimumSize: Size(double.maxFinite, 50),
                                    ),
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}