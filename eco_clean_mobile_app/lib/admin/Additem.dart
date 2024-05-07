import 'package:eco_clean_mobile_app/admin/update_bottom_sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';

import 'package:eco_clean_mobile_app/admin/add_bottom_sheet.dart';

class Additem extends StatefulWidget {
  const Additem({super.key});

  @override
  State<Additem> createState() => _AdditemState();
}
final databaseReference = FirebaseDatabase.instance.ref("ItemDetails");
class _AdditemState extends State<Additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("ECO CLEAN",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
      ),
      //For read/Display operation
      body: Column(
        children: [
          Expanded(child: FirebaseAnimatedList(query: databaseReference,
          itemBuilder: (context,snapshot,index,animation){

            return Card(shape: RoundedRectangleBorder(
              borderRadius : BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(10),
              child: ListTile(
              title: Text(snapshot.child("name").value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              subtitle:
              Text(snapshot.child("description").value.toString()),
              leading: CircleAvatar(
                  backgroundColor: Colors.lightGreenAccent[100],
              child: Text(snapshot.child("code").value.toString())),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snapshot.child("price").value.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
                  ),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      // For update operation
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: (){
                            Navigator.pop(context);
                            updateBottomSheet(
                                context,
                                snapshot.child("name").value.toString(),
                                snapshot.child("id").value.toString(),
                                snapshot.child("code").value.toString(),
                                snapshot.child("price").value.toString(),
                                snapshot.child("description").value.toString(),
                            );
                          },
                          leading: const Icon(Icons.edit),
                          title: const Text("Edit"),
                        ),
                      ),
                      //For delete operation
                      PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          onTap: (){
                            Navigator.pop(context);
                            databaseReference.child(
                                snapshot.child('id').value.toString())
                                .remove();
                          },
                          leading: const Icon(Icons.delete),
                          title: const Text("Delete"),
                        ),
                      ),
                      // Additional menu items can be added here
                    ],
                  ),
                ],
              ),
            ),
            );
          }
          ))
        ],
      ),
      //For create items
      floatingActionButton: FloatingActionButton(onPressed:() =>addBottomSheet(context),
      child: const Icon(Icons.add),
      ),
    );
  }
}
