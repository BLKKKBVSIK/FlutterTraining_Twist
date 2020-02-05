import 'package:flutter/material.dart';
import 'GradientAppBar.dart';
import 'HomePageBody.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomePageBody(),
        ],
      ),
    );
  }
}