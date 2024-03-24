// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class AdminMap extends StatefulWidget {
  const AdminMap({super.key});

  @override
  State<AdminMap> createState() => _AdminMapState();
}

class _AdminMapState extends State<AdminMap> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Locations'),
      ),
    );
  }
}

