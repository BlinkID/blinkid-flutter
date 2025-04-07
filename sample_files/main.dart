import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {

return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("BlinkID Sample"),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[],
          );
        },
      ),
    ),
  ),
);
  }
}

