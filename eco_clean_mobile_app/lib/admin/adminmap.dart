import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminMap extends StatefulWidget {
  const AdminMap({super.key});

  @override
  _AdminMapState createState() => _AdminMapState();
}

class _AdminMapState extends State<AdminMap> {
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
                title: "Sri Lanka Institute of Information Technology",
                snippet: "Sri Lanka",
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
  runApp(AdminMap());
}


