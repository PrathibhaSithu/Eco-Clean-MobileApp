import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class ForwardButtonMini extends StatelessWidget {
  final Function() onTap;
  const ForwardButtonMini({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFC4E8C2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(
          Ionicons.chevron_forward_outline,
        ),
      ),
    );
  }
}
