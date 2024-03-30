import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class CollectedPlaces extends StatefulWidget {
  const CollectedPlaces({super.key});

  @override
  State<CollectedPlaces> createState() => _CollectedPlacesState();
}

class _CollectedPlacesState extends State<CollectedPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Collected Places'),
      ),
    );
  }
}
