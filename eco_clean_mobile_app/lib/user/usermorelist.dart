import 'package:eco_clean_mobile_app/user/forwardbutton.dart';
import 'package:eco_clean_mobile_app/user/forwardbuttonmini.dart';
import 'package:eco_clean_mobile_app/user/moresettingdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class UserMoreList extends StatefulWidget {
  const UserMoreList({super.key});

  @override
  State<UserMoreList> createState() => _UserMoreListState();
}

class _UserMoreListState extends State<UserMoreList> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    "assets/imges/user.png",
                    height: 60,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${user!.email}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(height: 10),
                      const Text("User",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF418E3C),
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "More",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SettingDetails(
              title: "Account",
              img: "assets/imges/user.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Map",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Eco Edu",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Instructions",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "QR Scan",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Bin Status",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Categories",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Nearest Bin",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Buy Items",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Chat",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Feedback",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Issue Report",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
            const SizedBox(height: 10),
            SettingDetails(
              title: "Collected Places",
              img: "assets/imges/location.png",
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signout()),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}