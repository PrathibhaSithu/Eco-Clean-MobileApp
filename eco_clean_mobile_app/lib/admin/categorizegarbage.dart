import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categorizegarbage extends StatefulWidget {
  const categorizegarbage({super.key});

  @override
  State<categorizegarbage> createState() => _categorizegarbageState();
}

class _categorizegarbageState extends State<categorizegarbage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categorize Garbage"),),
    );
  }
}
