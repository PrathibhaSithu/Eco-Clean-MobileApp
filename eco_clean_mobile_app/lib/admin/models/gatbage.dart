import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';

//create a unique id using uuid
final uuid = Uuid().v4();

//date formatter
final formattedDate = DateFormat.yMd();

//enum for category
enum Category{ Battery, Organic, Ewaste, Plastic, Paper, Metal, Glass, Mixed  }

//category icons
final CategoryIcons = {
  Category.Battery :'assets/icons/batteries.png',
  Category.Organic : 'assets/icons/organic.png',
  Category.Ewaste : 'assets/icons/ewast.png',
  Category.Plastic : 'assets/icons/plastic.png',
  Category.Paper : 'assets/icons/paper.png',
  Category.Metal : 'assets/icons/metal.png',
  Category.Glass : 'assets/icons/glass.png',
  Category.Mixed : 'assets/icons/mixed.png',
};
/*final CategoryIcons = {
  Category.battery : Icons.battery_full,
  Category.organic : Icons.eco,
  Category.ewaste : Icons.delete,
  Category.plastic : Icons.bubble_chart,
  Category.paper : Icons.article,
  Category.metal : Icons.build,
  Category.glass : Icons.stacked_line_chart,
  Category.mixed : Icons.category,
};*/


class GarbageModel {

   //constructor
  GarbageModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category})
      : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //getter > formated data
  String get getFormatedDate {
    return formattedDate.format(date);
  }
}

