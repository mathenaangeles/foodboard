import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition defaultCamera = CameraPosition(
    target: LatLng(14.6537848, 121.0687486), // UP Diliman!
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: defaultCamera,
        // // Maybe implement something that goes to the user location?
        // onMapCreated: _animateToUser,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
