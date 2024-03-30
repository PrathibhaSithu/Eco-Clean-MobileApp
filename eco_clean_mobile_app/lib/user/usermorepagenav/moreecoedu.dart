import 'package:eco_clean_mobile_app/user/forwardbuttonaccountsetting.dart';
import 'package:eco_clean_mobile_app/user/forwardbuttonmini.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class MoreEcoEdu extends StatefulWidget {
  const MoreEcoEdu({super.key});

  @override
  State<MoreEcoEdu> createState() => _MoreEcoEduState();
}

class _MoreEcoEduState extends State<MoreEcoEdu> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${user!.email}'),
      ),
    );
  }
}
