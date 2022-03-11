import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'locations_service.dart';

class MyGoogleMaps extends StatefulWidget {
  const MyGoogleMaps({Key? key}) : super(key: key);

  @override
  _MyGoogleMapsState createState() => _MyGoogleMapsState();
}

class _MyGoogleMapsState extends State<MyGoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  var locationLatitude = "41.99734";
  var locationLongitude = "21.4279956";

  static final CameraPosition _kFinki = CameraPosition(
    target: LatLng(42.004142, 21.409902),
    zoom: 16,
  );
  static final CameraPosition _kSkopje = CameraPosition(
    target: LatLng(41.99734, 21.4279956),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('Локација за испити'),
              color: Colors.amber,
              onPressed: _goToFinki,
            ),
            IconButton(
                onPressed: () {
                  LocationService().getPlaceId(_searchController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
        Expanded(
            child: GoogleMap(
          initialCameraPosition: _kSkopje,
          markers: {_kFinkiMarker, _kParkMarker},
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )),
        FlatButton(
          onPressed: _goToYourLocation,
          color: Colors.amber,
          child: Text("Ваша локација"),
        ),
      ],
    ));
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

  Future<void> _goToFinki() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kFinki));
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

final Marker _kFinkiMarker = Marker(
    markerId: MarkerId('_kFinki'),
    infoWindow: const InfoWindow(
        title: "Факултет за информатички науки и компјутерско инженерство"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(42.004142, 21.409902));

final Marker _kParkMarker = Marker(
    markerId: MarkerId('_kPark'),
    infoWindow: const InfoWindow(title: "Градски парк"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(42.004967, 21.421191));
