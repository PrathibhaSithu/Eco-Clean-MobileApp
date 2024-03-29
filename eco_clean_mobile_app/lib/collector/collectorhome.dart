import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CollectorHome extends StatefulWidget {
  const CollectorHome({super.key});

  @override
  State<CollectorHome> createState() => _CollectorHomeState();
}

class _CollectorHomeState extends State<CollectorHome> {

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

