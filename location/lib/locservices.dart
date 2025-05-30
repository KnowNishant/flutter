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
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      logex.log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentpos = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
      );
      logex.log("Latitude=${currentpos.latitude.toString()}");
      logex.log("Longitude=${currentpos.longitude.toString()}");
    }
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
                getCurrentLocation();
              },
              child: Text("Get Location")),
        ),
      ),
    );
  }
}
