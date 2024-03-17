import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class AuthNotifier extends ChangeNotifier {
  late User _user;
  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  late Users _userDetails;
  Users get userDetails => _userDetails;

  void setUserDetails(Users users) {
    _userDetails = users;
    notifyListeners();
  }
}
