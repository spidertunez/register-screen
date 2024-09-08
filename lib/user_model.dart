import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _username = '';
  String _email = '';
  String _number = '';
  String _imageLink = '';

  String get username => _username;
  String get email => _email;
  String get number => _number;
  String get imageLink => _imageLink;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setNumber(String number) {
    _number = number;
    notifyListeners();
  }

  void setImageLink(String imageLink) {
    _imageLink = imageLink;
    notifyListeners();
  }
}

