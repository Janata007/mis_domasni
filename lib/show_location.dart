import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var locationLatitude = "";
  var locationLongitude = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Локациски сервис"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on,
            size: 46.0,
            color: Colors.amberAccent,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Превземи своја локација",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(locationLatitude + " " + locationLongitude),
          FlatButton(
            onPressed: () {
              getCurrentLocation();
            },
            child: Text("Превземи"),
            color: Colors.amber,
          )
        ],
      )),
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
}
