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
        leading: IconButton(onPressed: (){},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            Text("Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset("assets/imges/user.png",
                    height: 60,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${user!.email}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(height: 10),
                      Text("User",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF418E3C),
                            fontWeight: FontWeight.w500,
                          )),
                    ],),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFC4E8C2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Ionicons.chevron_forward_outline,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text("More",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/imges/location.png",
                      height: 60,
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text("Map",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      )),
                  const Spacer(),
                  Text("Eng"),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFC4E8C2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Ionicons.chevron_forward_outline,
                    ),
                  )
                ],

              ),
            ),
          ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=> signout()),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}