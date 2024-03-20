import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class CollectorH extends StatefulWidget {
  const CollectorH({super.key});

  @override
  State<CollectorH> createState() => _CollectorHState();
}

class _CollectorHState extends State<CollectorH> {

  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collector'),
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
