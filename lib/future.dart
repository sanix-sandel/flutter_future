import 'dart:async';
import 'package:async/async.dart';
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
                handleError();
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

  calculate() async {
    await new Future.delayed(
        const Duration(seconds: 5), () => completer.complete(42));
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

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((element) {
        total += element;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  Future returnError() {
    throw ('Something terrible happened!');
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }
}
