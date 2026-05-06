import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class UserProvider extends ChangeNotifier {
  UserProfile _user = UserProfile(
    name: 'Riad',
    email: 'riad@example.com',
  );

  UserProfile get user => _user;

  void updateProfile(String name, String email) {
    _user.name = name;
    _user.email = email;
    notifyListeners();
  }
}
