import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AdminH extends StatefulWidget {
  const AdminH({super.key});

  @override
  State<AdminH> createState() => _AdminHState();
}

class _AdminHState extends State<AdminH> {

  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
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
