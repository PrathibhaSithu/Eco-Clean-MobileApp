//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

class UserCategories extends StatefulWidget {
  const UserCategories({super.key});

  @override
  State<UserCategories> createState() => _UserCategoriesState();
}

class _UserCategoriesState extends State<UserCategories> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Categories'),
      ),
    );
  }
}


