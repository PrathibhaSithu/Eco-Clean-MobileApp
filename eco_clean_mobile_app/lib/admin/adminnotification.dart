// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class AdminNotification extends StatefulWidget {
  const AdminNotification({super.key});

  @override
  State<AdminNotification> createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Locations Update'),
      ),
    );
  }
}

