import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';

class Multiplemarkers extends StatefulWidget {
  const Multiplemarkers({super.key});

  @override
  State<Multiplemarkers> createState() => _MultiplemarkersState();
}

class _MultiplemarkersState extends State<Multiplemarkers> {

  late GoogleMapController _controller;
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    // Add multiple markers with custom images
    BitmapDescriptor customMarker1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), "img/car.png");

    BitmapDescriptor customMarker2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), "img/bus.png");

    _markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(37.7749, -122.4194),
        infoWindow: InfoWindow(title: 'Marker 1'),
        icon: customMarker1,

      ),
    );
    setState(() {});

    _markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(40.7128, -74.0060),
        infoWindow: InfoWindow(title: 'Marker 2'),
        icon: customMarker2,
      ),
    );
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiplemarkers"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map position
          zoom:2.0,
        ),
        markers: Set.from(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

        },
      ),
    );
  }
}

