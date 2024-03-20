import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class UserH extends StatefulWidget {
  const UserH({super.key});

  @override
  State<UserH> createState() => _UserHState();
}

class _UserHState extends State<UserH> {

  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=> signout()),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}
