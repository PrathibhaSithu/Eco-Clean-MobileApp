import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:flutter/material.dart';

final TextEditingController cityController = TextEditingController();
final TextEditingController roadController = TextEditingController();
final TextEditingController landmarkController = TextEditingController();
final TextEditingController cleaningperiodController = TextEditingController();
final TextEditingController latitudeController = TextEditingController();
final TextEditingController longitudeController = TextEditingController();
//final TextEditingController loadtypeController = TextEditingController();

void addnewbin(BuildContext context) {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController roadController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController cleaningperiodController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 30,
            left: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Add New Bin Details",
                  style: TextStyle(
                    color: Color(0xFF4CA547),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  hintText: "Enter City",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: roadController,
                decoration: InputDecoration(
                  labelText: "Road",
                  hintText: "Enter Road",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: landmarkController,
                decoration: InputDecoration(
                  labelText: "Landmark",
                  hintText: "Enter Landmark",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: latitudeController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Latitude",
                  hintText: "Enter Latitude",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: longitudeController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Longitude",
                  hintText: "Enter Longitude",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cleaningperiodController,
                decoration: InputDecoration(
                  labelText: "Cleaning Period",
                  hintText: "Daily/Weekly",
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                    ),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the input fields
                      if (cityController.text.trim().isEmpty ||
                          roadController.text.trim().isEmpty ||
                          landmarkController.text.trim().isEmpty ||
                          cleaningperiodController.text.trim().isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Enter Valid Data"),
                              content: const Text("Please enter valid data for all fields."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        // Proceed with adding the new bin details
                        final id = DateTime.now().microsecond.toString();
                        databaseReference.child(id).set({
                          "city": cityController.text.toString(),
                          "road": roadController.text.toString(),
                          "landmark": landmarkController.text.toString(),
                          "latitude": double.parse(latitudeController.text),
                          "longitude": double.parse(longitudeController.text),
                          "cleaningperiod": cleaningperiodController.text.toString(),
                          "id": id
                        });
                        // Clear the controllers
                        cityController.clear();
                        roadController.clear();
                        landmarkController.clear();
                        latitudeController.clear();
                        longitudeController.clear();
                        cleaningperiodController.clear();
                        // Dismiss the keyboard after adding items
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}





/*import 'package:flutter/material.dart';

import '../bin.dart';

final TextEditingController cityController = TextEditingController();
final TextEditingController roadController = TextEditingController();
final TextEditingController landmarkController = TextEditingController();
final TextEditingController cleaningperiodController = TextEditingController();

void addnewbin(BuildContext context) {
  String cityError = '';
  String roadError = '';
  String landmarkError = '';
  String cleaningPeriodError = '';

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 30,
            left: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Add New Bin Details",
                  style: TextStyle(
                    color: Color(0xFF4CA547),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  hintText: "Enter City",
                  errorText: cityError,
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: roadController,
                decoration: InputDecoration(
                  labelText: "Road",
                  hintText: "Enter Road",
                  errorText: roadError,
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: landmarkController,
                decoration: InputDecoration(
                  labelText: "Landmark",
                  hintText: "Enter Landmark",
                  errorText: landmarkError,
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: cleaningperiodController,
                decoration: InputDecoration(
                  labelText: "Cleaning Period",
                  hintText: "Daily/Weekly",
                  errorText: cleaningPeriodError,
                ),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close button action
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                    ),
                    child: const Text("Close",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                  ),

                  SizedBox(width: 20), // Adjust the width as needed for the desired spacing

                  ElevatedButton(
                      onPressed: () {
                        if (_validateInputs(cityError, roadError, landmarkError, cleaningPeriodError)) {
                          final id = DateTime.now().microsecond.toString();
                          databaseReference.child(id).set({
                            "city": cityController.text.toString(),
                            "road": roadController.text.toString(),
                            "landmark": landmarkController.text.toString(),
                            "cleaningperiod": cleaningperiodController.text.toString(),
                            "id": id
                          });
                          //for clear the controller
                          cityController.clear();
                          roadController.clear();
                          landmarkController.clear();
                          cleaningperiodController.clear();

                          //for dismiss the keyboard after adding items
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                      ),
                      child: Text("Add",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),)
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}

bool _validateInputs(String cityError, String roadError, String landmarkError, String cleaningPeriodError) {
  if (cityController.text.isEmpty) {
    cityError = 'Please enter a city';
  } else {
    cityError = '';
  }

  if (roadController.text.isEmpty) {
    roadError = 'Please enter a road';
  } else {
    roadError = '';
  }

  if (landmarkController.text.isEmpty) {
    landmarkError = 'Please enter a landmark';
  } else {
    landmarkError = '';
  }

  if (cleaningperiodController.text.isEmpty) {
    cleaningPeriodError = 'Please enter a cleaning period';
  } else {
    cleaningPeriodError = '';
  }

  return cityError.isEmpty && roadError.isEmpty && landmarkError.isEmpty && cleaningPeriodError.isEmpty;
}*/
