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
    _binCollectDataRef.onChildChanged.listen(_onBinCollectDataChanged);
  }

  Future<void> _loadFullBinIcon() async {
    final imageBytes = await rootBundle.load('assets/full_bin.png');
    setState(() {
      _fullBinIcon =
          BitmapDescriptor.fromBytes(imageBytes.buffer.asUint8List());
    });
  }

  void _onBinCollectDataChanged(DatabaseEvent event) async {
    final data = event.snapshot.value as Map<String, dynamic>;
    if (data['status'] == 'full') {
      final binId = event.snapshot.key;
      if (binId != null) {
        final binData = await _binDataRef.child(binId).once().then(
            (DatabaseEvent event) =>
                event.snapshot.value as Map<String, dynamic>);
        final lat = double.parse(binData['latitude']);
        final lng = double.parse(binData['longitude']);
        final title = 'Bin ${binData['id']}';
        final snippet =
            'City: ${binData['city']}\nCleaning Period: ${binData['cleaningperiod']}\nLandmark: ${binData['landmark']}}';
        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId(binId),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(title: title, snippet: snippet),
              icon: _fullBinIcon!,
            ),
          );
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
          target: LatLng(6.91473382014879, 79.97293852226254), // Malabe coordinates
          zoom: 15,
        ),
        markers: _markers,
      ),
    );
  }
}
