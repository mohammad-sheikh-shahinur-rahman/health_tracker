
import 'package:flutter/material.dart';

class UserProfileViewModel extends ChangeNotifier {
  // Add properties for user data
  String _name = 'Shahinur Rahman';
  String get name => _name;

  // Add methods to update user data
  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
