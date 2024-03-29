import 'package:eco_clean_mobile_app/user/forwardbuttonmini.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class SettingDetails extends StatelessWidget {
  final String title;
  final String img;
  final Function() onTap;

  const SettingDetails({
    super.key,
    required this.title,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            img,
            height: 60,
          ),
          const SizedBox(width: 30),
          Text(title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
          // Text("Eng"),
          const SizedBox(width: 10),
          ForwardButtonMini(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
