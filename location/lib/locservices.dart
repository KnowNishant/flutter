import 'dart:math';
import 'dart:developer' as logex;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({super.key});

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

// final LocationSettings locationSettings = LocationSettings(
//   accuracy: LocationAccuracy.high,
//   distanceFilter: 100,
//   timeLimit: Duration(minutes: 40)

// );
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  return await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 50,
      timeLimit: Duration(minutes: 10)
    )
  );
  
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Geolocator"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                _determinePosition(
                  
                );
              },
              child: Text("Get Location")),
        ),
      ),
    );
  }
}
