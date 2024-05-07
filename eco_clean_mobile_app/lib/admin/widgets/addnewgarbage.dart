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
import 'package:flutter/widgets.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';

class AddNewGarbage extends StatefulWidget {

  final void Function(GarbageModel garbage) onAddGarbage;
  const AddNewGarbage({super.key, required this.onAddGarbage});

  @override
  State<AddNewGarbage> createState() => _AddNewGarbageState();
}

class _AddNewGarbageState extends State<AddNewGarbage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  Category _selectedCategory = Category.Glass;

  //date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
      DateTime.now().year -1, DateTime.now().month, DateTime.now().day);
  final DateTime lastDate = DateTime(
      DateTime.now().year +1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();

  //date picker
  Future<void> _openDateModal() async {

    try{

      //show the date modle then store the user selected date
      final pickedDate =await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate);

      setState(() {
        _selectedDate = pickedDate!;
      });
    }catch(err){
      print(err.toString());
    }
  }

  void _handleFormSubmit () {
    //form validations
    //convert the amount in to a bouble
    final userAmount = double.parse(_amountController.text.trim());
    //final String title = _titleController.text.trim();
    //final String userAmount = _amountController.text.trim();

    if(_titleController.text.trim().isEmpty || userAmount <= 0){

      showDialog(
          context: context,
          builder: (context){
            return(
            AlertDialog(
              title: const Text("Enter Valid Data"),
              content: const Text("Please enter valide data for the title and the amount here the title can't be "
                  "empty and the amount can't be less then zero"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Close"))
            ],
            ));
          },
          );
    }
    else{

      //create the new garbage
      GarbageModel newGarbage = GarbageModel(
          title: _titleController.text.trim(),
          amount: userAmount,
          date: _selectedDate,
          category: _selectedCategory);
      //save the date
      widget.onAddGarbage(newGarbage);
      Navigator.pop(context);
    }
  }

  /*void _handleFormSubmit() {
    // Retrieve the trimmed string value from _amountController
    final userAmount = _amountController.text.trim();

    // Validate the title and userAmount
    if (_titleController.text.trim().isEmpty || userAmount.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Enter Valid Data"),
            content: const Text("Please enter valid data for the title and the amount. "
                "Here, the title can't be empty and the amount can't be empty."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    }else{

      //create the new garbage
      GarbageModel newGarbage = GarbageModel(
          title: _titleController.text.trim(),
          amount: userAmount,
          date: _selectedDate,
          category: _selectedCategory);
      //save the date
      widget.onAddGarbage(newGarbage);
      Navigator.pop(context);
    }

  }*/

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
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
                    hintText: "Enter the amount in Kg",
                    labelText: "Amount(Kg)",
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                ),
              ),

              //datepicker
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(formattedDate.format(_selectedDate)),
                    IconButton(
                      onPressed: _openDateModal,
                      icon: const Icon(Icons.date_range_outlined,
                        color: Color(0xFF5CD65C),),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //dropdown
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.centerLeft, // or AlignmentDirectional.topStart
              child: DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
            ),
          ),

          //Spacer(), // Pushes the following row to the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //close button
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
                  ),
                ),
              ),
              SizedBox(width: 20), // Adjust the width as needed for the desired spacing

              //save button
              ElevatedButton(
                onPressed: _handleFormSubmit,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
                ),
                child: const Text("Save",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
