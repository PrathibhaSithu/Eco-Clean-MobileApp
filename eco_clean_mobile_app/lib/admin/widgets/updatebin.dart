import 'package:eco_clean_mobile_app/admin/bin.dart';
import 'package:flutter/material.dart';

final TextEditingController cityController = TextEditingController();
final TextEditingController roadController = TextEditingController();
final TextEditingController landmarkController = TextEditingController();
final TextEditingController latitudeController = TextEditingController();
final TextEditingController longitudeController = TextEditingController();
final TextEditingController cleaningperiodController = TextEditingController();

//final TextEditingController loadtypeController = TextEditingController();

void updatebin(BuildContext context, city, road, id, landmark, latitude, longitude, cleaningperiod,) {
  cityController.text = city;
  roadController.text = road;
  landmarkController.text = landmark;
  latitudeController.text = latitude;
  longitudeController.text = longitude;
  cleaningperiodController.text = cleaningperiod;


  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    //backgroundColor: const Color(0xFFC4E8C2),
    builder: (BuildContext) {
      return SingleChildScrollView( // Wrap with SingleChildScrollView
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
                  "Upddate Bin Details",
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
                decoration: InputDecoration(
                  labelText: "Latitude",
                  hintText: "Enter Latitude",
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: longitudeController,
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
                        databaseReference.child(id).update({
                          "city": cityController.text.toString(),
                          "road": roadController.text.toString(),
                          "landmark": landmarkController.text.toString(),
                          "latitude": latitudeController.text.toString(),
                          "longitude": longitudeController.text.toString(),
                          "cleaningperiod": cleaningperiodController.text.toString(),


                        });


                        //for dismiss the keybord after adding items
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                      ),
                      child: Text("Update",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),)),
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
