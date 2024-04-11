import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:eco_clean_mobile_app/admin/categorizegarbage.dart';
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
                    height: 70,
                  ),
                  Text("Categorize Garbage", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => bin()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFC4E8C2),),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 'assets/imges/report.png',
                    height: 70,
                  ),
                  Text("Report Collection", style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          InkWell(
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
          ),


        ],
        ),
      ),
      ),
    );
  }
}

