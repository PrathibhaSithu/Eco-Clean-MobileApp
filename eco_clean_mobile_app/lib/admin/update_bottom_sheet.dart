import 'package:eco_clean_mobile_app/admin/Additem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final TextEditingController nameController = TextEditingController();
final TextEditingController codeController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController desController = TextEditingController();
void updateBottomSheet(BuildContext context, name,id,code,price,description){
  nameController.text = name;
  codeController.text = code;
  priceController.text = price;
  desController.text = description;
  showModalBottomSheet(
      isScrollControlled:true,
      backgroundColor: Colors.lightGreen,
      context: context,
      builder: (BuildContext context){
        return Padding(
            padding:  EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom+20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Add Items",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Item Name",

                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: "Item Code",

                  ),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: "Item Price",

                  ),
                ),
                TextField(
                  controller: desController,
                  decoration: const InputDecoration(
                    labelText: "Description",

                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed:() {
                  databaseReference.child(id).update({
                       'name': nameController.text.toString(),
                        'code': codeController.text.toString(),
                        'price': priceController.text.toString(),
                        'description':desController.text.toString()
                  });



                  // For Dismiss the keyboard after adding item
                  Navigator.pop(context);
                },
                child: const Text("update"))
              ],
            ));
      });
}