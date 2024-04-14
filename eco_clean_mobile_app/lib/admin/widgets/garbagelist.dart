import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/garbagetile.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GarbageList extends StatelessWidget {
  const GarbageList({super.key, required this.garbageList});

  final List<GarbageModel> garbageList;

  @override
  Widget build(BuildContext context) {
    if (garbageList == null || garbageList!.isEmpty) {
      // Handle case where garbageList is null or empty
      return Center(
        child: Text('No garbage items to display'),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: garbageList.length,
        itemBuilder: (context, index){
             return Padding(
               padding: const EdgeInsets.symmetric(
                 vertical: 5,
               ),
               child: GarbageTile(
                 garbage: garbageList[index],
               ),
             );
        },
      ),
    );
  }
}
