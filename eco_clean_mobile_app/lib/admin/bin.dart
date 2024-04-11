import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bin extends StatefulWidget {
  const bin({super.key});

  @override
  State<bin> createState() => _BinState();
}

class _BinState extends State<bin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bin"),),
    );
  }
}
