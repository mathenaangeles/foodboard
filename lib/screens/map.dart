import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MapView extends StatefulWidget {
  const MapView({Key key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  final _firestore = FirebaseFirestore.instance;
  final _geo = Geoflutterfire();
  Stream<List<DocumentSnapshot>> stream;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition defaultCamera = CameraPosition(
    target: LatLng(14.6537848, 121.0687486), // UP Diliman!
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    CollectionReference donations = _firestore.collection("donations");
    print(donations);
    stream = _geo.collection(collectionRef: donations).within(
        center: _geo.point(latitude: 14.6537848, longitude: 121.0687486),
        radius: 100,
        field: "point");
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      stream.listen((List<DocumentSnapshot> documentList) {
        _updateDonationMarkers(documentList);
      });
    });
  }

  void _updateDonationMarkers(List<DocumentSnapshot> documentList) {
    documentList.forEach((DocumentSnapshot document) {
      if (document.data()['status'] != "pending") return; // Ignore non-pending

      final title = document.data()['category'];
      final weight = document.data()['estWeight'];

      final GeoPoint point = document.data()['point']['geopoint'];
      _addMarker(
        point.latitude,
        point.longitude,
        title,
        "$weight kg, 5 km away",
      );
    });
  }

  void _addMarker(double lat, double lng, String title, String snippet) {
    final id = MarkerId(lat.toString() + lng.toString());
    final _marker = Marker(
      markerId: id,
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: title, snippet: snippet),
    );
    setState(() {
      markers[id] = _marker;
    });
  }

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
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}
