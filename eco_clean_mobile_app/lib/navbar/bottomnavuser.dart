import 'package:eco_clean_mobile_app/user/usercategories.dart';
import 'package:eco_clean_mobile_app/user/userlocation.dart';
import 'package:eco_clean_mobile_app/user/usermorelist.dart';
import 'package:eco_clean_mobile_app/user/usershopping.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff9d9d9d).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 35,
              //offset: const Offset(1, 20),
            ),
          ],),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF62B95D),
            selectedItemColor: const Color(0xFF418E3C),
            unselectedItemColor: const Color(0xFF000000),
            currentIndex: myCurrentIndex,
            onTap: (index){
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/location.png', width: 24, height: 24),
                label: 'Location',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/shopping-cart.png', width: 24, height: 24),
                label: 'Buy',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/cat.png', width: 24, height: 24),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/user.png', width: 24, height: 24),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
