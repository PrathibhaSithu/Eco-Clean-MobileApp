import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scaffold(
          body: Center(
            child: Text('${user!.email}'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (()=> signout()),
            child: const Icon(Icons.login_rounded),
          ),
        ),
      ],
    );
  }
}

