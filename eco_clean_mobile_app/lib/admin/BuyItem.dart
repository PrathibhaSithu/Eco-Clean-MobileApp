import 'package:flutter/material.dart';

class BuyItem extends StatefulWidget {

   @override
   State<StatefulWidget>  createState(){
     return BuyItemState();
   }
 }

 class BuyItemState extends State<BuyItem>{
   String? _uname;
   String? _uemail;
   String? _uaddress;
   String?  _utel;
   String? _weight;

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   void _clearForm() {
     setState(() {
       _uname = null;
       _uemail = null;
       _uaddress = null;
       _utel = null;
       _weight = null;
     });
     _formkey.currentState?.reset();
   }

   Widget _buildName() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Name'),
       validator: (String? value) {
         if (value == null || value.isEmpty) {
           return 'Name is required';
         }
         return null;
       },
       onSaved: (String? value) {
         _uname = value;
       },
     );
   }

   Widget _buildEmail() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Email'),
       validator: (String? value) {
         if (value == null || value.isEmpty) {
           return 'Email is required';
         }
         return null;
       },
       onSaved: (String? value) {
         _uemail = value;
       },
     );
   }

   Widget _buildAddress() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Address'),
       validator: (String? value) {
         if (value == null || value.isEmpty) {
           return 'Address is required';
         }
         return null;
       },
       onSaved: (String? value) {
         _uaddress = value;
       },
     );
   }

   Widget _buildTel() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Tel'),
       validator: (String? value) {
         if (value == null || value.isEmpty) {
           return 'Tel is required';
         }
         return null;
       },
       onSaved: (String? value) {
         _utel = value;
       },
     );
   }

   Widget _buildWeight() {
     return TextFormField(
       decoration: InputDecoration(labelText: 'Weight'),
       validator: (String? value) {
         if (value == null || value.isEmpty) {
           return 'Weight is required';
         }
         return null;
       },
       onSaved: (String? value) {
         _weight = value;
       },
     );
   }

   void _submitForm() {
     if (!_formkey.currentState!.validate()) {
       return;
     }
     _formkey.currentState!.save();
   }



   @override
   Widget build (BuildContext context){
     return Scaffold(
       appBar: AppBar (title: Text("Buy Item")),
       body: Container(
         margin: EdgeInsets.all(24),
         child: Form(
           key: _formkey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               _buildName(),
               _buildEmail(),
               _buildAddress(),
               _buildTel(),
               _buildWeight(),
               SizedBox(height: 20),
               ElevatedButton(
                 onPressed: _submitForm,
                 child: Text(
                   'Submit',
                   style: TextStyle(color: Colors.green, fontSize: 16),
                 ),
               ),
               SizedBox(height: 10), // Add some spacing
               ElevatedButton(
                 onPressed: _clearForm,
                 child: Text(
                   'Clear All',
                   style: TextStyle(color: Colors.red, fontSize: 16),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }


 }
