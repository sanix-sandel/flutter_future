import 'package:flutter/material.dart';
import 'package:flutter_future/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({Key? key}) : super(key: key);

  @override
  _NavigationFirstState createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color? color = Colors.blue[700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation First Screen'),
        backgroundColor: color,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _navigationAndGetColor(context);
          },
        ),
      ),
    );
  }

  _navigationAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationSecond()),
    );
    setState(() {
      color = color;
    });
  }
}
