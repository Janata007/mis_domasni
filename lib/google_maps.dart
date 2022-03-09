import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMaps extends StatefulWidget {
  const MyGoogleMaps({Key? key}) : super(key: key);

  @override
  _MyGoogleMapsState createState() => _MyGoogleMapsState();
}

class _MyGoogleMapsState extends State<MyGoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();
  var locationLatitude = "41.99734";
  var locationLongitude = "21.4279956";

  static final CameraPosition _kFinki = CameraPosition(
    target: LatLng(42.004142, 21.409902),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kFinki,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToYourLocation,
        label: Text('Your location!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationLatitude = "${position.latitude}";
      locationLongitude = "${position.longitude}";
    });
  }

  Future<void> _goToYourLocation() async {
    getCurrentLocation();
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(getCameraPosition()));
  }

  CameraPosition getCameraPosition() {
    return CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
            double.parse(locationLatitude), double.parse(locationLongitude)),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
  }
}
