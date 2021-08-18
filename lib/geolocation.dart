import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    getPosition().then((Position myPos) {
      myPosition = 'Latitude: ' +
          myPos.latitude.toString() +
          ' Longitude: ' +
          myPos.longitude.toString();
      setState(() {
        myPosition = myPosition;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Center(
          child: FutureBuilder(
        future: getPosition(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Something terrible happened');
            }
            return Text(snapshot.data);
          } else {
            return Text('');
          }
        },
      )),
    );
  }

  Future<Position> getPosition() async {
    await Future<int>.delayed(const Duration(seconds: 3), () => 1);
    Position position = await Geolocator.getLastKnownPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
