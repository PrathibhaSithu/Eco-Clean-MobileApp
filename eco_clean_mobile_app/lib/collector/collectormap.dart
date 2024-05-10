import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CollectorMap extends StatefulWidget {
  const CollectorMap({super.key});

  @override
  _CollectorMapState createState() => _CollectorMapState();
}

class _CollectorMapState extends State<CollectorMap> {
  late FirebaseDatabase _database;
  late final DatabaseReference _binCollectDataRef;
  late final DatabaseReference _binDataRef;
  Set<Marker> _markers = {};

  BitmapDescriptor? _fullBinIcon;

  @override
  void initState() {
    _database = FirebaseDatabase.instanceFor(app: Firebase.app());
    _binCollectDataRef = _database.reference().child('BinCollectData');
    _binDataRef = _database.reference().child('Bin Data');
    _loadFullBinIcon();
    _loadBinCollectData();
    _binCollectDataRef.onChildChanged.listen(_onBinCollectDataChanged);
  }

  Future<void> _loadBinCollectData() async {
    _markers = {};
    _binCollectDataRef.once().then((DatabaseEvent event) {
      final data = Map<String, dynamic>.from(
          event.snapshot.value as Map<Object?, Object?>);
      if (data.isNotEmpty) {
        for (final binId in data.keys) {
          if (data[binId]['status'] == "full") {
            _binDataRef.child(binId).once().then((DatabaseEvent event) {
              final binData = Map<String, dynamic>.from(
                  event.snapshot.value as Map<Object?, Object?>);
              final lat = binData['latitude'];
              final lng = binData['longitude'];
              final title = 'Bin ${binData['id']}';
              final snippet =
                  'City: ${binData['city']}\nCleaning Period: ${binData['cleaningperiod']}\nLandmark: ${binData['landmark']}\nRoad: ${binData['road']}';
              setState(() {
                _markers.add(Marker(
                  markerId: MarkerId(binId),
                  position: LatLng(lat, lng),
                  icon: _fullBinIcon!,
                  infoWindow: InfoWindow(title: title, snippet: snippet),
                ));
              });
            });
          }
        }
      }
    });
  }

  Future<void> _loadFullBinIcon() async {
    final imageBytes = await rootBundle.load('assets/icons/full_bin.png');
    setState(() {
      _fullBinIcon =
          BitmapDescriptor.fromBytes(imageBytes.buffer.asUint8List());
    });
  }

  void _onBinCollectDataChanged(DatabaseEvent event) {
    final data = Map<String, dynamic>.from(
        event.snapshot.value as Map<Object?, Object?>);
    final binId = event.snapshot.key;
    if (data['status'] == "full") {
      if (binId != null) {
        _binDataRef.child(binId).once().then((DatabaseEvent event) {
          final binData = Map<String, dynamic>.from(
              event.snapshot.value as Map<Object?, Object?>);
          final lat = binData['latitude'];
          final lng = binData['longitude'];
          final title = 'Bin ${binData['id']}';
          final snippet =
              'City: ${binData['city']}\nCleaning Period: ${binData['cleaningperiod']}\nLandmark: ${binData['landmark']}\nRoad: ${binData['road']}';
          setState(() {
            _markers.add(Marker(
              markerId: MarkerId(binId),
              position: LatLng(lat, lng),
              icon: _fullBinIcon!,
              infoWindow: InfoWindow(title: title, snippet: snippet),
            ));
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collector Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          // target: LatLng(7.09216, 79.959995),
          // Malabe coordinates
          target: LatLng(6.91473382014879, 79.97293852226254),
          // Malabe coordinates
          zoom: 15,
        ),
        markers: _markers,
      ),
    );
  }
}
