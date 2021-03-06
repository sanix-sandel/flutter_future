import 'package:flutter/material.dart';
import 'package:flutter_future/future.dart';
import 'package:flutter_future/geolocation.dart';
import 'package:flutter_future/navigation_dialog.dart';
import 'package:flutter_future/navigation_first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationDialog(),
    );
  }
}
