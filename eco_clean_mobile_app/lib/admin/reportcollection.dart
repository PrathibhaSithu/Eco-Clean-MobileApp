import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart'; // Assuming this is your model
import 'package:eco_clean_mobile_app/admin/widgets/garbage_report_generator.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class ReportCollection extends StatefulWidget {
  @override
  _ReportCollectionState createState() => _ReportCollectionState();
}

class _ReportCollectionState extends State<ReportCollection> {
  // Assuming you have access to garbage data as provided in your example
  List<GarbageModel> _garbageList = [
    GarbageModel(title: "Paper", amount: 10.0, date: DateTime.now(), category: Category.Paper),
    GarbageModel(title: "Glass", amount: 3.0, date: DateTime.now(), category: Category.Glass),
    GarbageModel(title: "Plastic", amount: 5.0, date: DateTime.now(), category: Category.Plastic),
    GarbageModel(title: "Battery", amount: 8.0, date: DateTime.now(), category: Category.Battery),
    GarbageModel(title: "Metal", amount: 6.0, date: DateTime.now(), category: Category.Metal),
    GarbageModel(title: "Organic", amount: 12.0, date: DateTime.now(), category: Category.Organic),
    GarbageModel(title: "Ewaste", amount: 7.0, date: DateTime.now(), category: Category.Ewaste),
    GarbageModel(title: "Mixed", amount: 15.0, date: DateTime.now(), category: Category.Mixed)
  ];

  Future<void> _generateGarbageReport() async {
    final pdf = GarbageReportGenerator.generateGarbageReport(_garbageList);

    // Save the PDF to a file in the application documents directory
    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/garbage_report.pdf');
    await file.writeAsBytes(await pdf.save());

    // Print and download the PDF
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());

    // Display the PDF using a PDF viewer
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFView(
        filePath: file.path,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report Collection",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF5CD65C)),
          ),
          onPressed: _generateGarbageReport,
          child: Text('Generate Garbage Report',
              style: TextStyle(
              color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        ),
      ),
    );
  }
}













/*class ReportCollection extends StatefulWidget {
  @override
  _ReportCollectionState createState() => _ReportCollectionState();
}

class _ReportCollectionState extends State<ReportCollection> {
  // Assuming you have access to garbage data as provided in your example
  List<GarbageModel> _garbageList = [
    GarbageModel(title: "Paper", amount: 10.0, date: DateTime.now(), category: Category.Paper),
    GarbageModel(title: "Glass", amount: 3.0, date: DateTime.now(), category: Category.Glass),
    GarbageModel(title: "Plastic", amount: 5.0, date: DateTime.now(), category: Category.Plastic),
    GarbageModel(title: "Battery", amount: 8.0, date: DateTime.now(), category: Category.Battery),
    GarbageModel(title: "Metal", amount: 6.0, date: DateTime.now(), category: Category.Metal),
    GarbageModel(title: "Organic", amount: 12.0, date: DateTime.now(), category: Category.Organic),
  ];

  void _generateGarbageReport() async {
    final pdf = GarbageReportGenerator.generateGarbageReport(_garbageList);

    // Save the PDF to a file in the application documents directory
    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/garbage_report.pdf');
    await file.writeAsBytes(await pdf.save());

    // Print and download the PDF
    Printing.layoutPdf(onLayout: (format) async => pdf.save());

    // Move the PDF to the application documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final newFile = await file.copy('${appDocDir.path}/garbage_report.pdf');

    // Display the PDF using a PDF viewer
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFView(
        filePath: file.path,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report Collection",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _generateGarbageReport,
          child: Text('Generate Garbage Report'),
        ),
      ),
    );
  }
}*/



/*import 'dart:io'; // Import 'dart:io' for File class
import 'package:path_provider/path_provider.dart'; // Import path_provider for getExternalStorageDirectory

import 'package:flutter/material.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/garbage_report_generator.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // Import PDFView

class ReportCollection extends StatefulWidget {
  @override
  _ReportCollectionState createState() => _ReportCollectionState();
}

class _ReportCollectionState extends State<ReportCollection> {
  List<GarbageModel> _garbageList = []; // Assuming you have access to garbage data

  void _generateGarbageReport() async {
    final pdf = GarbageReportGenerator.generateGarbageReport(_garbageList);

    // Save the PDF to a file
    final output = await getExternalStorageDirectory();
    final file = File('${output!.path}/garbage_report.pdf');
    await file.writeAsBytes(await pdf.save());

    // Display the PDF using a PDF viewer
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFView(
        filePath: file.path,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Collection", style: TextStyle(fontWeight: FontWeight.bold), ),
        //title: Text("Categorize Garbage"), TextStyle(color: Color(0xFF4CA547),fontSize: 30, fontWeight: FontWeight.bold)
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: _generateGarbageReport,
          child: Text('Generate Garbage Report'),
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
//import 'package:eco_clean_mobile_app/admin/widgets/garbage_report_generator.dart';

class ReportCollection extends StatefulWidget {
  @override
  _ReportCollectionState createState() => _ReportCollectionState();
}

class _ReportCollectionState extends State<ReportCollection> {
  List<GarbageModel> _garbageList = []; // Assuming you have access to garbage data

  void _generateGarbageReport() {
    //final pdf = GarbageReportGenerator.generateGarbageReport(_garbageList);
    // Save or display the generated PDF
    // For example, you can save the PDF to a file or display it using a PDF viewer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Collection", style: TextStyle(fontWeight: FontWeight.bold), ),
        //title: Text("Categorize Garbage"), TextStyle(color: Color(0xFF4CA547),fontSize: 30, fontWeight: FontWeight.bold)
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: _generateGarbageReport,
          child: Text('Generate Garbage Report'),
        ),
      ),
    );
  }
}*/




