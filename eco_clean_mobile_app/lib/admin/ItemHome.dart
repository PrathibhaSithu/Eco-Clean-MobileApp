import  'package:eco_clean_mobile_app/admin/BuyItem.dart';

import 'package:eco_clean_mobile_app/admin/Additem.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eco_clean_mobile_app/admin/modal.dart';
import 'package:flutter/src/services/asset_bundle.dart';

class ItemHome extends StatefulWidget {

  final List<Data> _photos = [
    Data(image: "assets/imges/iron.jpg", text: "Iron"),
    Data(image: "assets/imges/glass.jpg", text: "Glass"),
    Data(image: "assets/imges/plastic.jpg", text: "Plastic"),
    Data(image: "assets/imges/electronicdevice.jpg", text: "Electronic Device"),
  ];

  @override
  State<StatefulWidget> createState() {
    return ItemHomeState();
  }
}


class ItemHomeState extends State<ItemHome> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("ECO CLEAN",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Additem()));
              // Add onPressed logic for the first button
            },
            child: Text('Add Item', style: TextStyle(color: Colors.green),),
          ),
        ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyItem()));

            },
            child: Text('Buy Item',style: TextStyle(color: Colors.green),),
          ),
          ),
              ],
         ),
        ),


      ),
      body: GridView.builder(
        itemCount: widget._photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5, // Add elevation to give a material look
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(widget._photos[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget._photos[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Add navigation logic here based on index
          // For example, if index == 0, navigate to Home
          // If index == 1, navigate to Dashboard, etc.
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/admin-dash.png',
              width: 24,
              height: 24,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/location.png',
              width: 24,
              height: 24,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bell.png',
              width: 24,
              height: 24,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/cat.png',
              width: 24,
              height: 24,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}