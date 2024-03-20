import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Column(
          children: [
            Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ))
          ],
        )

    );
  }
}

// StreamBuilder(
// stream: FirebaseAuth.instance.authStateChanges(),
// builder: (context, snapshot) {
//       if (snapshot.hasData) {
//       User user = snapshot.data as User;
//       String email = user.email;
//       if (email == 'test@gmail.com') {
//       return Homepage1();
//       } else if (email == 'haha@gmail.com') {
//       return Homepage2();
//       } else if (email == 'adme@gmail.com') {
//       return Homepage3();
//       } else {
//       // If none of the above conditions are met, return a default homepage
//       return Homepage();
//       }
//       } else {
//       return Login();
// }
// },
// ),

//
// StreamBuilder(
// stream: FirebaseAuth.instance.authStateChanges(),
// builder: (context, snapshot){
// if(snapshot.hasData){
// return Homepage();
// } else {
// return Login();
// }
// }),