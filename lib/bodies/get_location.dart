// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:narong_transport/utilities/my_dialog.dart';

class GetLocationShowMap extends StatefulWidget {
  const GetLocationShowMap({Key? key}) : super(key: key);

  @override
  State<GetLocationShowMap> createState() => _GetLocationShowMapState();
}

class _GetLocationShowMapState extends State<GetLocationShowMap> {
  double? lat, lng;
  bool load = true;

  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<void> findLatLng() async {
    bool locationEnable;
    LocationPermission locationPermission;

    locationEnable = await Geolocator.isLocationServiceEnabled();
    if (locationEnable) {
      // Enable location
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        // permission is deniedForever
        MyDialog(context: context).normalDialog(
          title: 'Permission is denied forever',
          subTitle: 'Please enable permission',
          pressFunc: () {
            exit(0); // Close app
          },
        );
      }
      if (locationPermission == LocationPermission.denied) {
        // permission is denied
        await Geolocator.requestPermission();
      } else {
        // permission is always
        print('Found Location!');
        Position position = await findPosition();
        if (position != null) {
          lat = position.latitude;
          lng = position.longitude;
          print('lat => $lat || lng => $lng');
          load = false;
          setState(() {});
        }
      }
    } else {
      // Not enable location
      MyDialog(context: context).normalDialog(
        title: 'Non Location Service',
        subTitle: 'Please enable service',
        pressFunc: () {
          exit(0); // Close app
        },
      );
    }
  }

  Future<Position> findPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? Center(child: CircularProgressIndicator())
          : Text('This Get Location\nlat : $lat \nlng : $lng'),
    );
  }
}
