import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_4ahif_shop/main.dart';
import 'package:pos_4ahif_shop/model/user.dart';
import 'package:pos_4ahif_shop/pages/mainview-page.dart';
import 'package:pos_4ahif_shop/pages/registration-page.dart';
import 'package:pos_4ahif_shop/provider/user-provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: true);
    final loginEmailController = TextEditingController();
    final loginPasswordController = TextEditingController();

    @override
    void dispose() {
      loginEmailController.dispose();
      loginPasswordController.dispose();
      super.dispose();
    }

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('lib/assets/logo.png', width: 300,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
                  child: TextField(
                    controller: loginEmailController,
                    cursorColor: Color.fromARGB(255, 130, 93, 247),
                    decoration: InputDecoration(
                      labelText: 'E-Mail / Username',
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
                    controller: loginPasswordController,
                    cursorColor: Color.fromARGB(255, 130, 93, 247),
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
                Container(
                  width: double.infinity,
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: (){
                        print('Pressed Login');
                        String emailUsername = loginEmailController.text;
                        String password = loginPasswordController.text;

                        print('User: ' + emailUsername! + " : " + password!);

                        List<User> users = userProvider.users;

                        for (User user in users) {
                          if (user.email == emailUsername && user.password == password) {
                            userProvider.user = user;
                            print(user.id);
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MainView()
                                )
                            );
                          }
                          loginEmailController.clear();
                          loginPasswordController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 130, 93, 247),
                        backgroundColor: const Color.fromARGB(255, 130, 93, 247),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                      child: const Text('Log In')
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text('Other login methods:'),
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
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 130, 93, 247),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<RegistrationPage>(builder: (context) => RegistrationPage())
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromARGB(255, 130, 93, 247),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}