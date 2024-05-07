import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/addnewgarbage.dart';
import 'package:eco_clean_mobile_app/admin/widgets/garbagelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class categorizegarbage extends StatefulWidget {
  const categorizegarbage({super.key});

  @override
  State<categorizegarbage> createState() => _categorizegarbageState();
}

class _categorizegarbageState extends State<categorizegarbage> {

  //garbageList
  final List <GarbageModel> _garbageList = [
    //GarbageModel
    GarbageModel(title: "Paper", amount: 10.0, date: DateTime.now(), category: Category.Paper),
    GarbageModel(title: "Glass", amount: 3.0, date: DateTime.now(), category: Category.Glass),
    GarbageModel(title: "Plastic", amount: 5.0, date: DateTime.now(), category: Category.Plastic),
    GarbageModel(title: "Battery", amount: 8.0, date: DateTime.now(), category: Category.Battery),
    GarbageModel(title: "Metal", amount: 6.0, date: DateTime.now(), category: Category.Metal),
    GarbageModel(title: "Organic", amount: 12.0, date: DateTime.now(), category: Category.Organic),
    GarbageModel(title: "Ewaste", amount: 7.0, date: DateTime.now(), category: Category.Ewaste),
    //GarbageModel(title: "Mixed", amount: 15.0, date: DateTime.now(), category: Category.Ewaste)
  ];

  //Pie Chart
  Map<String, double> dataMap = {
    "Battery": 0,
    "Organic": 0,
    "Ewaste": 0,
    "Plastic": 0,
    "Paper": 0,
    "Metal": 0,
    "Glass": 0,
    "Mixed": 0,
  };

  //add new garbage
  void onAddNewGarbage(GarbageModel garbage){
    setState(() {
      _garbageList.add(garbage);
      calCategoryValues();
    });
  }

  //delete garbage
  void onDeleteGarbage(GarbageModel garbage){
    //store the deleting expence
    GarbageModel deletingGarbage = garbage;
    //get the index of the removing garbage
    final int removingIndex = _garbageList.indexOf(garbage);
    setState(() {
      _garbageList.remove(garbage);
      calCategoryValues();
    });

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Delete Successful"),
      action: SnackBarAction(label: "Undo", onPressed: (){
        setState(() {
          _garbageList.insert(removingIndex, deletingGarbage);
        });
      }),
    ));
  }

  //function to open a modal overlay
  void _openAddGarbageOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewGarbage(
          onAddGarbage: onAddNewGarbage,);
      },
    );
  }

//PIE CHART
  double BatteryVal = 0;
  double OrganicVal = 0;
  double EwasteVal = 0;
  double PlasticVal = 0;
  double PaperVal = 0;
  double MetalVal = 0;
  double GlassVal = 0;
  double MixedVal = 0;


  void calCategoryValues(){
    double BatteryValTotal = 0;
    double OrganicValTotal = 0;
    double EwasteValTotal = 0;
    double PlasticValTotal = 0;
    double PaperValTotal = 0;
    double MetalValTotal = 0;
    double GlassValTotal = 0;
    double MixedValTotal = 0;

    for( final garbage in _garbageList){

      if(garbage.category == Category.Battery){
        BatteryValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Organic){
        OrganicValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Ewaste){
        EwasteValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Plastic){
        PlasticValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Paper){
        PaperValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Metal){
        MetalValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Glass){
        GlassValTotal += garbage.amount as double;
      }
      if(garbage.category == Category.Mixed){
        MixedValTotal += garbage.amount as double;
      }
    }

    setState(() {
      BatteryVal = BatteryValTotal;
      OrganicVal = OrganicValTotal;
      EwasteVal = EwasteValTotal;
      PlasticVal = PlasticValTotal;
      PaperVal = PaperValTotal;
      MetalVal = MetalValTotal;
      GlassVal = GlassValTotal;
      MixedVal = MixedValTotal;
    });

    //update the dateMap
    dataMap = {
      "Battery": BatteryVal,
      "Organic": OrganicVal,
      "Ewaste": EwasteVal,
      "Plastic": PlasticVal,
      "Paper": PaperVal,
      "Metal": MetalVal,
      "Glass": GlassVal,
      "Mixed": MixedVal,
    };
  }

  @override
  void initState() {
    super.initState();
    calCategoryValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Categorize Garbage", style: TextStyle(fontWeight: FontWeight.bold), ),
        //title: Text("Categorize Garbage"), TextStyle(color: Color(0xFF4CA547),fontSize: 30, fontWeight: FontWeight.bold)
        backgroundColor: const Color(0xFF4CA547),
        elevation: 0,
        actions:[
      Container(
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Handle button press
              _openAddGarbageOverlay(context);
            },
            child: SizedBox(
              width: 45, // Adjust the size as needed
              height: 45, // Adjust the size as needed
              child: Icon(
                Icons.add,
                color: Color(0xFF4CA547),
              ),
            ),
          ),
        ),
      ),
    )
          /* Container(
              color: const Color(0xFFFFFFFF),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      Icons.add,
                    color: Color(0xFF4CA547),)))*/
        ],
      ),

    body: Column(
      children: [
        PieChart(dataMap: dataMap),
        GarbageList(garbageList: _garbageList, onDeleteGarbage: onDeleteGarbage,),
      ],
    ),
    );
  }
}
