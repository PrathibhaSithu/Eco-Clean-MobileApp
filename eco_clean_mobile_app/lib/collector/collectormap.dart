// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class CollectorLocation extends StatefulWidget {
  const CollectorLocation({super.key});

  @override
  State<CollectorLocation> createState() => _CollectorLocationState();
}

class _CollectorLocationState extends State<CollectorLocation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Collector Locations'),
      ),
    );
  }
}

