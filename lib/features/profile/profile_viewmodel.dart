
import 'package:flutter/material.dart';
import 'package:health_tracker/models/user_model.dart';
import 'package:health_tracker/services/user_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserService _userService = UserService();

  User? _user;
  User? get user => _user;

  ProfileViewModel() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _user = await _userService.getUser();
    if (_user == null) {
      // Create a default user if none exists
      _user = const User(name: 'Shahinur Rahman');
      await _userService.saveUser(_user!);
    }
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    _user = user;
    await _userService.saveUser(user);
    notifyListeners();
  }
}
