import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../collector/collectorhome.dart';
import '../collector/collectormap.dart';
import '../collector/collectormorelist.dart';
import '../collector/collectornotification.dart';

class BottomNavCollector extends StatefulWidget {
  const BottomNavCollector({super.key});

  @override
  State<BottomNavCollector> createState() => _BottomNavCollectorState();
}

class _BottomNavCollectorState extends State<BottomNavCollector> {
  int myCurrentIndex = 0;
  List pages = const[
    CollectorHome(),
    CollectorMap(),
    CollectorNotification(),
    CollectorMoreList()

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
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/bell.png', width: 24, height: 24),
                label: 'Notifications',
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
