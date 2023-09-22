
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_location_picker/map_location_picker.dart';

class GoggleMapLocation extends StatefulWidget {


  @override
  State<GoggleMapLocation> createState() => _GoggleMapLocationState();
}

class _GoggleMapLocationState extends State<GoggleMapLocation> {
  LatLng _center =  LatLng(21.1702, 72.8311);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoggleMapLocation"),
      ),
      body:  GoogleMap(
        mapType: MapType.normal,

        markers: {
          Marker(
            markerId:MarkerId("surat"),
            position: LatLng(21.1702, 72.8311),
          ),
          Marker(
            markerId:MarkerId("olpad"),
            position: LatLng(21.3401, 72.7554),
          ),
          Marker(
            markerId:MarkerId("bardoli"),
            position: LatLng(21.1255, 73.1122),
          ),
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          // target: LatLng(21.1702,72.8311),
          zoom: 11,
        ),
        onMapCreated: (GoogleMapController controller) {},
      ),


    );
  }

}
