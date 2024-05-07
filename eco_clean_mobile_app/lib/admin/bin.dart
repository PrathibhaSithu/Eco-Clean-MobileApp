import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_clean_mobile_app/admin/widgets/addnewbin.dart';
import 'package:eco_clean_mobile_app/admin/widgets/updatebin.dart';

class bin extends StatefulWidget {
  const bin({Key? key}) : super(key: key);

  @override
  State<bin> createState() => _BinState();
}

final databaseReference = FirebaseDatabase.instance.ref("Bin Data");

class _BinState extends State<bin> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  //Search Bar
  void onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: isSearchClicked
            ? Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius:  BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 0,
              ),
            ],
          ),
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 13, 10, 10),
                hintStyle: TextStyle(color: Color(0xFF4CA547)),
                border: InputBorder.none,
                hintText: 'Search...'),
          ),
        )
            : const Text(
          "Create Bin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
        actions: [
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
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(
                Icons.search,
                color: Color(0xFF4CA547), // Same icon color as the "Add" button
              ),
            ),
          ),
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
                  onTap: () => addnewbin(context),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFF4CA547),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, index, animation) {
                final city = snapshot.child("city").value.toString().toLowerCase();
                final road = snapshot.child("road").value.toString().toLowerCase();
                final cleaningPeriod = snapshot.child("cleaningperiod").value.toString().toLowerCase();
                final id = snapshot.child("id").value.toString();
                final landmark = snapshot.child("landmark").value.toString().toLowerCase();
                 final double latitude = double.parse(snapshot.child("latitude").value.toString());
                final double longitude = double.parse(snapshot.child("longitude").value.toString());

                if (city.contains(searchText.toLowerCase()) ||
                    road.contains(searchText.toLowerCase()) ||
                    cleaningPeriod.contains(searchText.toLowerCase()) ||
                    id.contains(searchText.toLowerCase()) ||
                    landmark.contains(searchText.toLowerCase()) ||
                   latitude.toString().contains(searchText.toLowerCase()) ||
                    longitude.toString().contains(searchText.toLowerCase())) {
                  return Card(
                    color: Color(0xFFC4E8C2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        snapshot.child("city").value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.child("road").value.toString()),
                          Text(snapshot.child("landmark").value.toString()),
                          Text(latitude.toString()),
                          Text(longitude.toString()),
                          Text(snapshot.child("cleaningperiod").value.toString()),

                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF5CD65C),
                        child: Text(
                          id,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Image.asset(
                          'assets/icons/more_vert.png',
                          width: 24,
                          height: 24,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                updatebin(
                                  context,
                                  snapshot.child("city").value.toString(),
                                  snapshot.child("road").value.toString(),
                                  id,
                                  snapshot.child("landmark").value.toString(),
                                   latitude,
                                  longitude,
                                  snapshot.child("cleaningperiod").value.toString(),
                                );
                              },
                              leading: Image.asset(
                                'assets/icons/edit.png',
                                width: 20,
                                height: 20,
                              ),
                              title: Text(
                                "Edit",
                                style: TextStyle(
                                  color: Color(0xFF4CA547),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                databaseReference
                                    .child(id)
                                    .remove();
                              },
                              leading: Image.asset(
                                'assets/icons/delete.png',
                                width: 20,
                                height: 20,
                              ),
                              title: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color(0xFF4CA547),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(); // Return an empty widget if it doesn't match the search criteria
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*import 'dart:async';
import 'dart:io';

import 'package:eco_clean_mobile_app/admin/widgets/addnewbin.dart';
import 'package:eco_clean_mobile_app/admin/widgets/updatebin.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class bin extends StatefulWidget {
  const bin({Key? key}) : super(key: key);

  @override
  State<bin> createState() => _BinState();
}

final databaseReference = FirebaseDatabase.instance.ref("Bin Data");

class _BinState extends State<bin> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  //Search Bar
  void onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: isSearchClicked
            ? Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 0,
              ),
            ],
          ),
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 13, 10, 10),
                hintStyle: TextStyle(color: Color(0xFF4CA547)),
                border: InputBorder.none,
                hintText: 'Search...'),
          ),
        )
            : const Text(
          "Create Bin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
        actions: [
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
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(
                Icons.search,
                color: Color(0xFF4CA547), // Same icon color as the "Add" button
              ),
            ),
          ),
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
                  onTap: () => addnewbin(context),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFF4CA547),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              List<Map<String, dynamic>> binData = await fetchBinDataFromFirebase();
              await generatePDFReport(binData);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PDFScreen()),
              );
            },
            icon: Icon(Icons.picture_as_pdf),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, index, animation) {
                final city = snapshot.child("city").value.toString().toLowerCase();
                final road = snapshot.child("road").value.toString().toLowerCase();
                final cleaningPeriod =
                snapshot.child("cleaningperiod").value.toString().toLowerCase();
                final id = snapshot.child("id").value.toString();
                final landmark = snapshot.child("landmark").value.toString().toLowerCase();
                final latitude = snapshot.child("latitude").value.toString().toLowerCase();
                final longitude = snapshot.child("longitude").value.toString().toLowerCase();

                if (city.contains(searchText.toLowerCase()) ||
                    road.contains(searchText.toLowerCase()) ||
                    cleaningPeriod.contains(searchText.toLowerCase()) ||
                    id.contains(searchText.toLowerCase()) ||
                    landmark.contains(searchText.toLowerCase()) ||
                    latitude.contains(searchText.toLowerCase()) ||
                    longitude.contains(searchText.toLowerCase())) {
                  return Card(
                    color: Color(0xFFC4E8C2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        snapshot.child("city").value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.child("road").value.toString()),
                          Text(snapshot.child("landmark").value.toString()),
                          Text(snapshot.child("latitude").value.toString()),
                          Text(snapshot.child("longitude").value.toString()),
                          Text(snapshot.child("cleaningperiod").value.toString()),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFF5CD65C),
                        child: Text(
                          id,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Image.asset(
                          'assets/icons/more_vert.png',
                          width: 24,
                          height: 24,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                updatebin(
                                  context,
                                  snapshot.child("city").value.toString(),
                                  snapshot.child("road").value.toString(),
                                  id,
                                  snapshot.child("landmark").value.toString(),
                                  snapshot.child("latitude").value.toString(),
                                  snapshot.child("longitude").value.toString(),
                                  snapshot.child("cleaningperiod").value.toString(),
                                );
                              },
                              leading: Image.asset(
                                'assets/icons/edit.png',
                                width: 20,
                                height: 20,
                              ),
                              title: Text(
                                "Edit",
                                style: TextStyle(
                                  color: Color(0xFF4CA547),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                databaseReference.child(id).remove();
                              },
                              leading: Image.asset(
                                'assets/icons/delete.png',
                                width: 20,
                                height: 20,
                              ),
                              title: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color(0xFF4CA547),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox(); // Return an empty widget if it doesn't match the search criteria
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> fetchBinDataFromFirebase() async {
  DatabaseEvent event = await databaseReference.once();
  DataSnapshot dataSnapshot = event.snapshot;
  List<Map<String, dynamic>> binData = [];

  if (dataSnapshot.value != null && dataSnapshot.value is Map<dynamic, dynamic>) {
    Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
    values.forEach((key, value) {
      binData.add({
        'city': value['city'],
        'road': value['road'],
        'landmark': value['landmark'],
        'latitude': value['latitude'],
        'longitude': value['longitude'],
        'cleaningperiod': value['cleaningperiod'],
        'id': key,
      });
    });
  }

  return binData;
}

Future<void> generatePDFReport(List<Map<String, dynamic>> binData) async {
  final pdf = pw.Document();

  // Add title to the PDF
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Center(
        child: pw.Text('Bin Report', style: pw.TextStyle(fontSize: 20)),
      ),
    ),
  );

  // Add bin data to the PDF
  for (final bin in binData) {
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('City: ${bin['city']}'),
            pw.Text('Road: ${bin['road']}'),
            pw.Text('Landmark: ${bin['landmark']}'),
            pw.Text('Latitude: ${bin['latitude']}'),
            pw.Text('Longitude: ${bin['longitude']}'),
            pw.Text('Cleaning Period: ${bin['cleaningperiod']}'),
            pw.SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Save the PDF to a file
  final output = await getTemporaryDirectory();
  final file = File('${output.path}/bin_report.pdf');
  await file.writeAsBytes(await pdf.save());
}

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({Key? key, this.pdfPath = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Open the PDF file using the default viewer
            if (pdfPath.isNotEmpty) {
              await _openPDF(context);
            } else {
              // Error handling if the PDF path is empty
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('Failed to open PDF. Please try again.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), // Navigate back to the previous screen
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }

  Future<void> _openPDF(BuildContext context) async {
    try {
      await Printing.sharePdf(bytes: File(pdfPath).readAsBytesSync());
    } catch (e) {
      // Error handling if the PDF cannot be opened
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to open PDF. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Navigate back to the previous screen
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}*/











/*import 'package:eco_clean_mobile_app/admin/widgets/addnewbin.dart';
import 'package:eco_clean_mobile_app/admin/widgets/updatebin.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bin extends StatefulWidget {
  const bin({super.key});

  @override
  State<bin> createState() => _BinState();
}

final databaseReference = FirebaseDatabase.instance.ref("Bin Data");

class _BinState extends State<bin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Create Bin", style: TextStyle(fontWeight: FontWeight.bold), ),
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
                  //For Create Operation
                  onTap: () => addnewbin(context),
                    // Handle button press
                   // _openAddGarbageOverlay(context);

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

      //for Read/Display Operation
      body: Column(
        children: [
          Expanded(child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, index, animation){
                return Card(
                  color: Color(0xFFC4E8C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                        snapshot.child("city").value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),

                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child("road").value.toString()),
                        Text(snapshot.child("landmark").value.toString()),
                        Text(snapshot.child("cleaningperiod").value.toString()),
                      ],
                    ),

                    leading: CircleAvatar(
                        backgroundColor: const Color(0xFF5CD65C),
                        child: Text(snapshot.child("id").value.toString(),
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                    )
                    ),

                    trailing: PopupMenuButton(
                      icon: Image.asset(
                        'assets/icons/more_vert.png',
                        width: 24, // Adjust width
                        height: 24, // Adjust height
                      ),
                      itemBuilder: (context) => [

                        // For Update Operation
                        PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: (){
                                Navigator.pop(context);
                                updatebin(
                                    context,
                                    snapshot.child("city").value.toString(),
                                    snapshot.child("road").value.toString(),
                                    snapshot.child("id").value.toString(),
                                    snapshot.child("landmark").value.toString(),
                                    snapshot.child("cleaningperiod").value.toString(),
                                );
                              },
                              leading: Image.asset(
                                'assets/icons/edit.png',
                                width: 20, // Adjust width
                                height: 20, // Adjust height
                              ),
                              title: Text("Edit", style: TextStyle(
                                color: Color(0xFF4CA547),
                              ),
                              ),
                            ),),

                        //for Delete Operation
                        PopupMenuItem(
                          value: 2,
                          child: ListTile(
                            onTap: (){
                              Navigator.pop(context);
                              databaseReference
                                  .child(
                                        snapshot.child("id").value.toString())
                                  .remove();
                            },
                            leading: Image.asset(
                              'assets/icons/delete.png',
                              width: 20, // Adjust width
                              height: 20, // Adjust height
                            ),
                            title: Text("Delete", style: TextStyle(
                              color: Color(0xFF4CA547),
                            ),
                            ),
                          ),)
                      ],
                    ),


                  ),
                );




              }))
        ],
      ),


    );
  }
}*/



















/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:eco_clean_mobile_app/admin/widgets/addnewbin.dart';
import 'package:eco_clean_mobile_app/admin/widgets/updatebin.dart';

class bin extends StatefulWidget {
  const bin({Key? key}) : super(key: key);

  @override
  _BinPageState createState() => _BinPageState();
}

final databaseReference = FirebaseDatabase.instance.ref("Bin Data");

class _BinPageState extends State<bin> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Create Bin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF4CA547),
        elevation: 0,
        actions: [
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
                  onTap: () => addnewbin(context),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFF4CA547),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Bin ID',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Perform search operation here
                    // You can access the search query using searchController.text
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, index, animation) {
                // Your existing list item widget code goes here
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:eco_clean_mobile_app/admin/widgets/addnewbin.dart';
import 'package:eco_clean_mobile_app/admin/widgets/updatebin.dart';

class bin extends StatefulWidget {
  const bin({Key? key}) : super(key: key);

  @override
  State<bin> createState() => _BinState();
}

class _BinState extends State<bin> {
  late TextEditingController searchController;
  late Query _searchQuery;
  bool _showNotFound = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _searchQuery = FirebaseDatabase.instance.ref("Bin Data");
  }

  void _runSearch() {
    setState(() {
      String searchText = searchController.text.trim();
      if (searchText.isNotEmpty) {
        _searchQuery = FirebaseDatabase.instance.ref("Bin Data").orderByChild("id").equalTo(searchText);
        _showNotFound = true; // Assume not found until proven otherwise
      } else {
        _searchQuery = FirebaseDatabase.instance.ref("Bin Data");
        _showNotFound = false; // Reset flag if search text is empty
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Bins", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
        actions: [
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
                  onTap: () => addnewbin(context),
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
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (_) => _runSearch(),
                    decoration: InputDecoration(
                      hintText: 'Search Bin ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _runSearch, // Invoke the search function
                ),
              ],
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: _searchQuery,
              itemBuilder: (context, snapshot, index, animation) {
                if (!snapshot.exists) {
                  return Center(
                    child: Text("Bin ID not found"),
                  );
                }
                _showNotFound = false; // Reset flag if search yields results
                return Card(
                  color: Color(0xFFC4E8C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      snapshot.child("city").value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child("road").value.toString()),
                        Text(snapshot.child("landmark").value.toString()),
                        Text(snapshot.child("cleaningperiod").value.toString()),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF5CD65C),
                      child: Text(
                        snapshot.child("id").value.toString(),
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: PopupMenuButton(
                      icon: Image.asset(
                        'assets/icons/more_vert.png',
                        width: 24, // Adjust width
                        height: 24, // Adjust height
                      ),
                      itemBuilder: (context) => [
                        // For Update Operation
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              updatebin(
                                context,
                                snapshot.child("city").value.toString(),
                                snapshot.child("road").value.toString(),
                                snapshot.child("id").value.toString(),
                                snapshot.child("landmark").value.toString(),
                                snapshot.child("cleaningperiod").value.toString(),
                              );
                            },
                            leading: Image.asset(
                              'assets/icons/edit.png',
                              width: 20, // Adjust width
                              height: 20, // Adjust height
                            ),
                            title: Text(
                              "Edit",
                              style: TextStyle(
                                color: Color(0xFF4CA547),
                              ),
                            ),
                          ),
                        ),
                        // For Delete Operation
                        PopupMenuItem(
                          value: 2,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              FirebaseDatabase.instance
                                  .ref("Bin Data")
                                  .child(snapshot.child("id").value.toString())
                                  .remove();
                            },
                            leading: Image.asset(
                              'assets/icons/delete.png',
                              width: 20, // Adjust width
                              height: 20, // Adjust height
                            ),
                            title: Text(
                              "Delete",
                              style: TextStyle(
                                color: Color(0xFF4CA547),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              defaultChild: _showNotFound ? Text("Bin ID not found") : null,
            ),
          ),
        ],
      ),
    );
  }
}*/



