import 'package:eco_clean_mobileapp/models/users.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthNotifier extends ChangeNotifier {
  Users? _users;
  Users? get user => _users;

  void setUser(Users users) {
    _users = users;
    notifyListeners();
  }

  Users? _usersDetails;
  Users? get userDetails => _usersDetails;

  void setUserDetails(Users? users) {
    _usersDetails = users;
    notifyListeners();
  }
}
