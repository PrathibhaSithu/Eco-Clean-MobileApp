import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eco Clean',
      theme: ThemeData(
        primaryColor: Color(0xFF62B95D),
      ),
      home: Scaffold(
        body: LandingPage(),
      ),
    );
  }
}

class LandingPage extend