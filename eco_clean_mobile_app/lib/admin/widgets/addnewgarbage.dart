/*//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';

class AddNewGarbage extends StatefulWidget {
  const AddNewGarbage({super.key});

  @override
  State<AddNewGarbage> createState() => _AddNewGarbageState();
}

class _AddNewGarbageState extends State<AddNewGarbage> {
  
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add New Garbage Details",
            style: TextStyle(
              color: Color(0xFF4CA547),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),


        //title text feild
        TextField(
          controller: _titleController,
          decoration: InputDecoration(
              hintText: "Enter new garbage details",
              label:  Text("Title")),
        keyboardType: TextInputType.text,
          maxLength: 50,
        ),
      
        Row(
          children: [
            //amount
            Expanded(
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    hintText: "Enter the amount",
                    label:  Text("Amount")),
                keyboardType: TextInputType.number,
                maxLength: 50,
              ),
            ),
            
            //datapicker
            Expanded(
                child: Row(
                  children: [
                    Text("2024/04/14"),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
            )
        ],
    ),


    Row(
      children: [
        DropdownButton(
          items: Category.values
             .map(
                (category) => DropdownMenuItem(
                   value: category,
                   child: Text(category.name),) ),
            .toList(),
          onChanged: (value){},
        )
      ],
    )

      ],);
  }
}*/


import 'package:flutter/material.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';

class AddNewGarbage extends StatefulWidget {
  const AddNewGarbage({Key? key}) : super(key: key);

  @override
  State<AddNewGarbage> createState() => _AddNewGarbageState();
}

class _AddNewGarbageState extends State<AddNewGarbage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Category _selctedCategory = Category.Glass;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Add New Garbage Details",
              style: TextStyle(
                color: Color(0xFF4CA547),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "Enter new garbage details",
              labelText: "Title",
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hintText: "Enter the amount",
                    labelText: "Amount",
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("2024/04/14"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton<Category>(
                items: Category.values.map((category) {
                  return DropdownMenuItem<Category>(
                    value: _selctedCategory,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selctedCategory = value!;
                  });
                },
              ),
            Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //close the model button
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  ),
                  child: const Text("Close"),
                ),

                //save the data and clse the modal button
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                  ),
                  child: const Text("Save"),
                ),
              ],
            ))

            ],
          ),
        ],
      ),
    );
  }
}

