import 'package:flutter/material.dart';

class HomeAppBar {
  static getAppBar() {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Column(children: [
        Text(
          "Virometer",
          style: TextStyle(color: Color(0xff3A0CA3),fontSize:23),
        ),
        Text('Freitag 25. Dezember', style: TextStyle(color: Color(0xff6E6E6E),fontSize: 10)),
      ]),
    );
  }
}
