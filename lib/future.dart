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
                count();
                /*getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });*/
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

  Future<int> returnOneAsync() async {
    await Future<int>.delayed(const Duration(seconds: 3), () => 1);
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future<int>.delayed(const Duration(seconds: 3), () => 2);
    return 2;
  }

  Future<int> returnThreeAsync() async {
    return await Future<int>.delayed(const Duration(seconds: 3), () => 1);
    //return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = total.toString();
    });
  }
/*
  Future<dynamic> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  calculate() async {
    await new Future.delayed(
        const Duration(seconds: 5), () => completer.complete(42));
  }*/
}
