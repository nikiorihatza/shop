import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/main.dart';
import 'package:pos_4ahif_shop/model/user.dart';
import 'package:pos_4ahif_shop/pages/mainview-page.dart';
import 'package:pos_4ahif_shop/provider/user-provider.dart';
import 'package:provider/provider.dart';

import 'login-page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: true);
    final registerFirstNameController = TextEditingController();
    final registerLastNameController = TextEditingController();
    final registerEmailController = TextEditingController();
    final registerPasswordController = TextEditingController();
    final registerRepeatPasswordController = TextEditingController();

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
                      controller: registerFirstNameController,
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
                      controller: registerLastNameController,
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
                      controller: registerEmailController,
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
                      controller: registerPasswordController,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                      controller: registerRepeatPasswordController,
                      cursorColor: const Color.fromARGB(255, 130, 93, 247),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Repeat password',
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
                  Container(
                    width: double.infinity,
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: (){
                          print('Pressed Register');
                          String firstName = registerFirstNameController.text;
                          String lastName = registerLastNameController.text;
                          String email = registerEmailController.text;
                          String password = registerPasswordController.text;
                          String repeated = registerRepeatPasswordController.text;

                          print('User: ' + email! + " : " + password!);

                          List<User> users = userProvider.users;
                          
                          bool unique = true;

                          for (User user in users) {
                            if (user.email == email) {
                              unique = false;
                            }
                          }
                          
                          if (unique) {
                            User registeredUser = User(firstName: firstName, lastName: lastName, email: email, password: password, favorites: '', orders: '', currentCart: '');
                            userProvider.addUser(registeredUser);
                            registeredUser.register();
                            Navigator.of(context).push(
                              MaterialPageRoute<LoginPage>(builder: (context) => LoginPage())
                            );
                          }

                          registerFirstNameController.clear();
                          registerLastNameController.clear();
                          registerEmailController.clear();
                          registerPasswordController.clear();
                          registerRepeatPasswordController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 130, 93, 247),
                            backgroundColor: const Color.fromARGB(255, 130, 93, 247),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        child: const Text('Register')
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text('Other register methods:'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 130, 93, 247),
                          ),
                          child: Image.asset('lib/assets/logmethods-pics/apple-logo-black-outlined.png'),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 130, 93, 247),
                          ),
                          child: Image.asset('lib/assets/logmethods-pics/google-logo-black-outlined.png'),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 130, 93, 247),
                          ),
                          child: Image.asset('lib/assets/logmethods-pics/facebook-logo-black-outlined.png'),
                        ),
                      ),
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