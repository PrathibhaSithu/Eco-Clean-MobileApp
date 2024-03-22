import 'package:eco_clean_mobile_app/homepage.dart';
import 'package:eco_clean_mobile_app/login.dart';
import 'package:eco_clean_mobile_app/userh.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'adminh.dart';
import 'collectorh.dart';
import 'navbar/bottomnavuser.dart';

class Wrapper extends StatefulWidget {
  Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
            if (snapshot.hasData) {
            User user = snapshot.data as User;
            String? email = user.email;
            if (email == 'test@gmail.com') {
            return BottomNavUser();
            } else if (email == 'haha@gmail.com') {
            return CollectorH();
            } else if (email == 'adme@gmail.com') {
            return AdminH();
            } else {
            // If none of the above conditions are met, return a default homepage
            return UserH();
            }
            } else {
            return Login();
        }}),
      );
  }
}



