import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserLocation extends StatefulWidget {
  const UserLocation({super.key});

  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
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
            zoom: 13,
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
  runApp(UserLocation());
}