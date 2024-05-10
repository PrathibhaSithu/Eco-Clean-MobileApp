import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class IssueReport extends StatefulWidget {
  const IssueReport({super.key});

  @override
  State<IssueReport> createState() => _IssueReportState();
}

class _IssueReportState extends State<IssueReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Issue Report'),
      ),
    );
  }
}
