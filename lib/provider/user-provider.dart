import 'package:flutter/cupertino.dart';
import 'package:pos_4ahif_shop/model/user.dart';

class UserProvider extends ChangeNotifier {
  late List<User> _users;
  List<User> get users => _users;

  late User _user;
  User get user => _user;

  UserProvider() {
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    _users = await User.fetchUser();
    notifyListeners();

    for (User user in _users) {
      print('Name: ${user.firstName} ${user.lastName}');
      print('Email: ${user.email}');
      print('ID: ${user.id}');
      print('---------------------');
    }
  }

  set user(User value) {
    _user = value;
  }

  set users(List<User> value) {
    _users = value;
  }

  void addUser(User newUser) {
    _users.add(newUser);
    notifyListeners();
  }
}