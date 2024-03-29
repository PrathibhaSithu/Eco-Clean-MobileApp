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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

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



// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFC4E8C2),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Add an image at the top of the screen
//               Image.asset(
//                 'assets/imges/login.png',
//                 height: 350,
//               ),
//               // Wrap the login form in a container
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: email,
//                       decoration: const InputDecoration(
//                         hintText: 'Email',
//                       ),
//                     ),
//                     TextField(
//                       controller: password,
//                       decoration: const InputDecoration(
//                         hintText: 'Password',
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: (()=>signIn()),
//                       child: const Text("Login"),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:eco_clean_mobile_app/register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//
//   bool _hidePassword = true;
//
//   signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFC4E8C2),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Add an image at the top of the screen
//               Image.asset(
//                 'assets/imges/login.png',
//                 height: 350,
//               ),
//               // Wrap the login form in a container
//               IntrinsicWidth(
//                 child: IntrinsicHeight(
//                   child: Container(
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     width: 400,
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: email,
//                           decoration: const InputDecoration(
//                             hintText: 'Email',
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         StatefulBuilder(
//                           builder: (BuildContext context, setState) {
//                             return TextField(
//                               controller: password,
//                               obscureText: _hidePassword,
//                               decoration: InputDecoration(
//                                 hintText: 'Password',
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _hidePassword ? Icons.visibility_off : Icons.visibility,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _hidePassword = !_hidePassword;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 30),
//                         ElevatedButton(
//                           onPressed: () {
//                             signIn();
//                           },
//                           child: const Text("Login"),
//                         ),
//                         const SizedBox(height: 20),
//                         TextButton(
//                           onPressed: () {
//                             // Navigate to the `Register` page
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (BuildContext context) {
//                                   return Register();
//                                 },
//                               ),
//                             );
//                           },
//                           child: const Text("Not a user? Register"),
//                         ),
//
//
//                         // onPressed: () {
//                         //   // Navigate to the `Register` page
//                         //   Navigator.pushNamed(context, '/register');
//                         // },
//                         // child: const Text("Not a user? Register"),
//                         //),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }


// class SettingDetails extends StatelessWidget {
//   final String title;
//   final String imgPath;
//   final Function() onTap;
//
//   const SettingDetails({
//     super.key,
//     required this.title,
//     required this.imgPath,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         children: [
//           Image.asset(
//             imgPath,
//             height: 60,
//           ),
//           const SizedBox(width: 30),
//           Text(title,
//               style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//               )),
//           const Spacer(),
//           // Text("Eng"),
//           const SizedBox(width: 10),
//           ForwardButtonMini(
//             onTap: onTap,
//           ),
//         ],
//       ),
//     );
//   }
// }