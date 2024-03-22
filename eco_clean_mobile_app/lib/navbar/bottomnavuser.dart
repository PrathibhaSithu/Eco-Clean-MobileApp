import 'package:eco_clean_mobile_app/user/usercategories.dart';
import 'package:eco_clean_mobile_app/user/userlocation.dart';
import 'package:eco_clean_mobile_app/user/usermorelist.dart';
import 'package:eco_clean_mobile_app/user/usershopping.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user/userhome.dart';

class BottomNavUser extends StatefulWidget {
  const BottomNavUser({super.key});

  @override
  State<BottomNavUser> createState() => _BottomNavUserState();
}

class _BottomNavUserState extends State<BottomNavUser> {
  int myCurrentIndex = 0;
  List pages = const[
    UserHome(),
    UserLocation(),
    UserShopping(),
    UserCategories(),
    UserMoreList()
  ];


  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'More',
          ),
        ],
      ),
      body: pages[myCurrentIndex],
    );
  }
}
