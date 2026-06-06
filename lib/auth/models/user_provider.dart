import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void resetUser() {
    _username = '';
    _email = '';
    notifyListeners();
  }
}
