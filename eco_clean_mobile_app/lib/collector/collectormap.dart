import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollectorMap extends StatefulWidget {
  const CollectorMap({super.key});

  @override
  _CollectorMapState createState() => _CollectorMapState();
}

class _CollectorMapState extends State<CollectorMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.90356, 79.86129);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Maps Sample App'),
        //   backgroundColor: Colors.green[700],
        // ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: MarkerId("SLIIT"),
              position: _center,
              infoWindow: InfoWindow(
                title: "SLIIT",
                snippet: "Sri Lanka Institute of Information Technology",
              ),
            ),
          },
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }
}

void main() {
  runApp(CollectorMap());
}