<<<<<<< HEAD
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/addnewgarbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/garbagelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
>>>>>>> f356e3ba084a2d8cf0e3c5e84afb799d72832182

class categorizegarbage extends StatefulWidget {
  const categorizegarbage({super.key});

  @override
  State<categorizegarbage> createState() => _categorizegarbageState();
}

class _categorizegarbageState extends State<categorizegarbage> {
<<<<<<< HEAD

  //garbageList
  final List <GarbageModel> _garbageList = [
    //GarbageModel
    GarbageModel(title: "Paper", amount: "10Kg", date: DateTime.now(), category: Category.Paper),
    GarbageModel(title: "Glass", amount: "5kg", date: DateTime.now(), category: Category.Glass),
    GarbageModel(title: "Plastic", amount: "5kg", date: DateTime.now(), category: Category.Plastic)
  ];

  //function to open a modal overlay
  void _openAddGarbageOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewGarbage();
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorize Garbage", style: TextStyle(fontWeight: FontWeight.bold), ),
        //title: Text("Categorize Garbage"), TextStyle(color: Color(0xFF4CA547),fontSize: 30, fontWeight: FontWeight.bold)
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
        actions:[
      Container(
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Handle button press
              _openAddGarbageOverlay(context);
            },
            child: SizedBox(
              width: 45, // Adjust the size as needed
              height: 45, // Adjust the size as needed
              child: Icon(
                Icons.add,
                color: Color(0xFF4CA547),
              ),
            ),
          ),
        ),
      ),
    )
          /* Container(
              color: const Color(0xFFFFFFFF),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      Icons.add,
                    color: Color(0xFF4CA547),)))*/
        ],
      ),

    body: Column(
      children: [
        GarbageList(garbageList: _garbageList),
      ],
    ),
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categorize Garbage"),),
>>>>>>> f356e3ba084a2d8cf0e3c5e84afb799d72832182
    );
  }
}
