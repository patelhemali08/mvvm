// import 'dart:async';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapImagemarker extends StatefulWidget {
//
//
//   @override
//   State<MapImagemarker> createState() => _MapImagemarkerState();
// }
//
// class _MapImagemarkerState extends State<MapImagemarker> {
//
//   Completer<GoogleMapController> _controller = Completer();
//
//   // given camera position
//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(19.0759837, 72.8776559),
//     zoom: 15,
//   );
//
//   Uint8List? marketimages;
//   List<String> images = ['images/car.png',];
//
//   // created empty list of markers
//   final List<Marker> _markers = <Marker>[];
//
//   // created list of coordinates of various locations
//   final List<LatLng> _latLen = <LatLng>[
//
//     LatLng(19.0759837, 72.8776559),
//     LatLng(28.679079, 77.069710),
//     LatLng(26.850000, 80.949997),
//     LatLng(24.879999, 74.629997),
//     LatLng(16.166700, 74.833298),
//     LatLng(12.971599, 77.594563),
//   ];
//
//   // declared method to get Images
//   Future<Uint8List> getImages(String path, int width) async{
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//   // created method for displaying custom markers according to index
//   loadData() async{
//
//     for(int i=0 ;i<images.length; i++){
//       final Uint8List markIcons = await getImages(images[i], 200);
//       // makers added according to index
//       _markers.add(
//           Marker(
//             // given marker id
//             markerId: MarkerId(i.toString()),
//             // given marker icon
//             icon: BitmapDescriptor.fromBytes(markIcons),
//             // given position
//             position: _latLen[i],
//             infoWindow: InfoWindow(
//               // given title for marker
//               title: 'Location: '+i.toString(),
//             ),
//           )
//       );
//       setState(() {
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MapImagemarker"),
//       ),
//       body: Container(
//         child: SafeArea(
//           child: GoogleMap(
//
//             initialCameraPosition: _kGoogle,
//
//             markers: Set<Marker>.of(_markers),
//
//             mapType: MapType.normal,
//
//
//
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapImagemarker extends StatefulWidget {
  const MapImagemarker({Key? key}) : super(key: key);

  @override
  _MapImagemarkerState createState() => _MapImagemarkerState();
}

class _MapImagemarkerState extends State<MapImagemarker> {

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('surat'),
      position: LatLng(21.1702, 72.831),
      infoWindow: InfoWindow(title: 'Marker 1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: MarkerId('adajan'),
      position: LatLng(21.1959, 72.7933),
      infoWindow: InfoWindow(title: 'Marker 2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),

    // Add more markers as needed
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // on below line we have given title of app
        title: Text("GFG"),
      ),
      body:GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(21.1702, 72.831), // Initial map position
          zoom: 2,
        ),

        markers: Set.from(_markers),

        onMapCreated: (GoogleMapController controller) {

        },
      ),
    );
  }
}

