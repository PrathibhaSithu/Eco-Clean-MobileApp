import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollectorMap extends StatefulWidget {
  const CollectorMap({super.key});
  @override
  _CollectorMapState createState() => _CollectorMapState();
}

class _CollectorMapState extends State<CollectorMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

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
              markerId: MarkerId("Sydney"),
              position: _center,
              infoWindow: InfoWindow(
                title: "Sydney",
                snippet: "Capital of New South Wales",
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