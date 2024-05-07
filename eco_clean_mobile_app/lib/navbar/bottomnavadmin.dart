import 'package:flutter/material.dart';
import '../admin/admindashboard.dart';
import '../admin/adminhome.dart';
import '../admin/adminmorelist.dart';
import '../admin/adminmap.dart';
import '../admin/adminnotification.dart';
import '../admin/ItemHome.dart'; // Import ItemHome.dart

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({Key? key}) : super(key: key);

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  int myCurrentIndex = 0;

  // Define a list of pages
  final List<Widget> pages = [
    AdminHome(),
    AdminDashboard(),
    AdminMap(),
    AdminNotification(),
    AdminMoreList(),
    ItemHome(), // Add ItemHome() to the list
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
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF62B95D),
            selectedItemColor: const Color(0xFF418E3C),
            unselectedItemColor: const Color(0xFF000000),
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });

              // Navigation logic
              if (index == 5) { // If the "More" icon is tapped (index 5)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemHome()), // Navigate to ItemHome page
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png',
                    width: 24, height: 24),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/admin-dash.png',
                    width: 24, height: 24),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/location.png',
                    width: 24, height: 24),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/bell.png',
                    width: 24, height: 24),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/cat.png',
                    width: 24, height: 24),
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
