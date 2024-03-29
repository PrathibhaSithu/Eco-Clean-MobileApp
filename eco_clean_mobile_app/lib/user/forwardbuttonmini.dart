import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class ForwardButtonMini extends StatefulWidget {
  const ForwardButtonMini({super.key});

  @override
  State<ForwardButtonMini> createState() => _ForwardButtonMiniState();
}

class _ForwardButtonMiniState extends State<ForwardButtonMini> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFC4E8C2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Icon(
        Ionicons.chevron_forward_outline,
      ),
    );
  }
}
