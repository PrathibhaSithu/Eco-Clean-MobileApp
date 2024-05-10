import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class UserInstruction extends StatefulWidget {
  const UserInstruction({super.key});

  @override
  State<UserInstruction> createState() => _UserInstructionState();
}

class _UserInstructionState extends State<UserInstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Instructions'),
      ),
    );
  }
}
