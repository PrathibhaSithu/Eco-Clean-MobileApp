import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class UserBinStatus extends StatefulWidget {
  const UserBinStatus({super.key});

  @override
  State<UserBinStatus> createState() => _UserBinStatusState();
}

class _UserBinStatusState extends State<UserBinStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bin Status'),
      ),
    );
  }
}
