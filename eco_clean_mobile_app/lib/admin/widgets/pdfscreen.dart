/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated PDF'),
      ),
      body: Center(
        child: ElevatedButton( // Changed from RaisedButton to ElevatedButton
          onPressed: () async {
            // Open the PDF file using the default viewer
            await _openPDF(context);
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }

  Future<void> _openPDF(BuildContext context) async {
    try {
      await Printing.sharePdf(bytes: File(pdfPath).readAsBytesSync());
    } catch (e) {
      // Error handling if the PDF cannot be opened
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to open PDF. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}*/


/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Open the PDF file using the default viewer
            await _openPDF(context);
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }

  Future<void> _openPDF(BuildContext context) async {
    try {
      await Printing.sharePdf(bytes: File(pdfPath).readAsBytesSync());
    } catch (e) {
      // Error handling if the PDF cannot be opened
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to open PDF. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}*/



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:printing/printing.dart';

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Open the PDF file using the default viewer
            await _openPDF(context);
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }

  Future<void> _openPDF(BuildContext context) async {
    try {
      await Printing.sharePdf(bytes: File(pdfPath).readAsBytesSync());
    } catch (e) {
      // Error handling if the PDF cannot be opened
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to open PDF. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // Navigate back to the previous screen
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

