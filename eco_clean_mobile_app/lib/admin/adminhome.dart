/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:eco_clean_mobile_app/admin/categorizegarbage.dart';
import 'package:eco_clean_mobile_app/admin/reportcollection.dart';

class adminhome extends StatefulWidget {
  const adminhome({Key? key}) : super(key: key);

  @override
  State<adminhome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<adminhome> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CA547),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imges/ecoclean.png',
              height: 60,
            ),
            const SizedBox(width: 10),
            const Text(
              'Admin Dashboard',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        // Adjust the preferredSize to change the height of the app bar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Adjust as needed
          child: Container(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF4CA547),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('assets/imges/user.png'),
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(30),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bin()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFC4E8C2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image.asset(
                        'assets/imges/createbin.png',
                        height: 70,
                      ),
                      Text(
                        "Create Bin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => categorizegarbage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFC4E8C2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image.asset(
                        'assets/imges/categorize.png',
                        height: 80,
                      ),
                      Text(
                        "Categorize Garbage",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportCollection()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFC4E8C2),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image.asset(
                          'assets/imges/report.png',
                          height: 60,
                        ),
                        Text(
                          "Report Collection",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/




/*import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:eco_clean_mobile_app/admin/categorizegarbage.dart';
import 'package:eco_clean_mobile_app/admin/reportcollection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home", style: TextStyle(color: Color(0xFF4CA547),fontSize: 30, fontWeight: FontWeight.bold), ),),


      body: Container(child: Padding(
        padding: const EdgeInsets.all(10.0),

        child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10,crossAxisSpacing: 10),children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => bin()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFC4E8C2),),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset( 'assets/imges/createbin.png',
                  height: 70,
                ),
                Text("Create Bin", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
            ),
          ),


          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => categorizegarbage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFC4E8C2),),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'assets/imges/categorize.png',
                    height: 80,
                  ),
                  Text("Categorize Garbage", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportCollection()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFC4E8C2),),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'assets/imges/report.png',
                    height: 60,
                  ),
                  Text("Report Collection", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

         /* InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => bin()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFC4E8C2),),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'assets/imges/viewcomplain.png',
                    height: 70,
                  ),
                  Text("View Complaints", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),*/


        ],
        ),
      ),
      ),
    );
  }
}*/



import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:eco_clean_mobile_app/admin/categorizegarbage.dart';
import 'package:eco_clean_mobile_app/admin/reportcollection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/imges/ecoclean.png',
              height: 100,
              width: 200,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi Admin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/imges/user.png'),
                    radius: 30,

                  ),
                ],
              ),
            ),



            Expanded(
              child: GridView(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bin(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFC4E8C2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imges/createbin.png',
                            height: 70,
                          ),
                          const Text(
                            "Create Bin",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => categorizegarbage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFC4E8C2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imges/categorize.png',
                            height: 80,
                          ),
                          const Text(
                            "Categorize Garbage",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportCollection(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFC4E8C2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imges/report.png',
                            height: 60,
                          ),
                          const Text(
                            "Report Collection",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


