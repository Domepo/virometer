import '../viro_home/homescreen_appbar.dart';
import 'package:flutter/material.dart';
class Districts extends StatefulWidget {
  @override
  _StatesState createState() =>
      _StatesState();
}

class _StatesState
    extends State<Districts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar.getAppBar(),
        body: ListView(children: [Text("Landkreis")]));
  }
}