import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../admin/collectorhome.dart';


class BottomNavCollector extends StatefulWidget {
  const BottomNavCollector({super.key});

  @override
  State<BottomNavCollector> createState() => _BottomNavUserState();
}

class _BottomNavUserState extends State<BottomNavCollector> {
  int myCurrentIndex = 0;
  List pages = const[
    CollectorHome(),
    CollectorLocation(),
    CollectorShopping(),
    CollectorCategories(),
    CollectorMoreList()
  ];


  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

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
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
