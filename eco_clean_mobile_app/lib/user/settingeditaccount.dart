import 'package:eco_clean_mobile_app/user/forwardbuttonaccountsetting.dart';
import 'package:eco_clean_mobile_app/user/forwardbuttonmini.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class EditAccountSetting extends StatefulWidget {
  const EditAccountSetting({super.key});

  @override
  State<EditAccountSetting> createState() => _EditAccountSettingState();
}

class _EditAccountSettingState extends State<EditAccountSetting> {
  final user = FirebaseAuth.instance.currentUser;

  String gender = "man";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Ionicons.chevron_back_outline),
            ),
            leadingWidth: 80,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFF97D093),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: Size(50, 50),
                    elevation: 3,
                  ),
                  icon: Icon(Ionicons.checkmark, color: Colors.white),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  EditItem(
                    title: "Photo",
                    widget: Column(
                      children: [
                        Image.asset(
                          "assets/imges/user.png",
                          height: 100,
                          width: 100,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.lightBlueAccent,
                          ),
                          child: const Text("Upload Image"),
                        )
                      ],
                    ),
                  ),
                  const EditItem(
                    title: "Name",
                    widget: TextField(),
                  ),
                  const SizedBox(height: 40),
                  EditItem(
                    title: "Gender",
                    widget: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gender = "man";
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: gender == "man"
                                ? Colors.deepPurple
                                : Colors.grey.shade200,
                            fixedSize: const Size(50, 50),
                          ),
                          icon: Icon(
                            Ionicons.male,
                            color: gender == "man" ? Colors.white : Colors.black,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gender = "woman";
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: gender == "woman"
                                ? Colors.deepPurple
                                : Colors.grey.shade200,
                            fixedSize: const Size(50, 50),
                          ),
                          icon: Icon(
                            Ionicons.female,
                            color: gender == "woman" ? Colors.white : Colors.black,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Age",
                  ),
                  const SizedBox(height: 40),
                  const EditItem(
                    widget: TextField(),
                    title: "Email",
                  ),
                ],
              ),
            ),
          ),
    );
  }
}