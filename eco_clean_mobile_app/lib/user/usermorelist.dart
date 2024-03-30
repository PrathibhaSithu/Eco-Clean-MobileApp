import 'package:eco_clean_mobile_app/user/forwardbutton.dart';
import 'package:eco_clean_mobile_app/user/forwardbuttonmini.dart';
import 'package:eco_clean_mobile_app/user/moresettingdetails.dart';
import 'package:eco_clean_mobile_app/user/settingeditaccount.dart';
import 'package:eco_clean_mobile_app/user/usercategories.dart';
import 'package:eco_clean_mobile_app/user/userlocation.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/morebinstat.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/morechat.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/morecollectedplaces.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/moreecoedu.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/morefeedback.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/moreinstructions.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/moreissuereport.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/morenearestbin.dart';
import 'package:eco_clean_mobile_app/user/usermorepagenav/moreqrscan.dart';
import 'package:eco_clean_mobile_app/user/usershopping.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ionicons/ionicons.dart';

class UserMoreList extends StatefulWidget {
  const UserMoreList({super.key});

  @override
  State<UserMoreList> createState() => _UserMoreListState();
}

class _UserMoreListState extends State<UserMoreList> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/imges/user.png",
                      height: 60,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user!.email}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(height: 10),
                        const Text("User",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF418E3C),
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    const Spacer(),
                    // ForwardButton(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountSetting(),
                    //     ));
                    //   },
                    // ),
                  ],
                ),),
              const SizedBox(height: 30),
              const Text(
                "More",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingDetails(
                title: "Account",
                img: "assets/imges/user.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountSetting(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Map",
                img: "assets/imges/location.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserLocation(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Eco Edu",
                img: "assets/imges/ecoedu.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreEcoEdu(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Instructions",
                img: "assets/imges/instruction.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserInstruction(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "QR Scan",
                img: "assets/imges/qrscan.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScan(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Bin Status",
                img: "assets/imges/binstatus.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserBinStatus(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Categories",
                img: "assets/imges/garbagecat.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserCategories(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Nearest Bin",
                img: "assets/imges/nearest bin.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NearestBinTrack(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Buy Items",
                img: "assets/imges/buy.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserShopping(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Chat",
                img: "assets/imges/chat.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserChat(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Feedback",
                img: "assets/imges/feedback.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackPage(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Issue Report",
                img: "assets/imges/issue.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const IssueReport(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Collected Places",
                img: "assets/imges/collectbins.png",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CollectedPlaces(),
                  ));
                },
              ),
              const SizedBox(height: 10),
              SettingDetails(
                title: "Temp",
                img: "assets/imges/collectbins.png",
                 onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => const CollectedPlaces(),
                //   ));
                 },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signout()),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }
}