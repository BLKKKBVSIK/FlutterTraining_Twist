import 'package:flutter/material.dart';
import 'package:planettwist/model/Item.dart';
import 'ui/details/detailPage.dart';
import 'ui/home/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanetTwist',
      home: HomePage(),
    );
  }
}
