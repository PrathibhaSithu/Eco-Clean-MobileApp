import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class NearestBinTrack extends StatefulWidget {
  const NearestBinTrack({super.key});

  @override
  State<NearestBinTrack> createState() => _NearestBinTrackState();
}

class _NearestBinTrackState extends State<NearestBinTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Nearest Bin Location'),
      ),
    );
  }
}
