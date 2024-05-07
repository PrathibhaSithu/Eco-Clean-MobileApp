import 'package:eco_clean_mobile_app/admin/Additem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final TextEditingController nameController = TextEditingController();
final TextEditingController codeController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextEditingController desController = TextEditingController();
void addBottomSheet(BuildContext context) {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.lightGreen,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Add Items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Item Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: "Item Code",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: "Item Price",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: desController,
                maxLength: 25,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final id = DateTime.now().microsecond.toString();
                    databaseReference.child(id).set({
                      'name': nameController.text.toString(),
                      'code': codeController.text.toString(),
                      'price': priceController.text.toString(),
                      'description': desController.text.toString(),
                      'id': id, //unique id
                    });
                    // For clear the controller
                    nameController.clear();
                    codeController.clear();
                    priceController.clear();
                    desController.clear();
                    // For Dismiss the keyboard after adding item
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add"),
              )
            ],
          ),
        ),
      );
    },
  );
}
