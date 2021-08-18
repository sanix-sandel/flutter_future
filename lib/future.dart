import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  late String result = '';
  late Completer completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              child: Text('GO!'),
              onPressed: () {
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });
              },
            ),
            Spacer(),
            Text(result.toString()),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  calculate() async {
    await new Future.delayed(
        const Duration(seconds: 5), () => completer.complete(42));
  }
}
