import 'package:flutter/material.dart';

class HomeAppBar {
  static getAppBar() {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        'Virometer',
        style: TextStyle(color: Color(0xff3A0CA3), fontSize: 25),
      ),
      bottom: PreferredSize(
          child: Text("Dienstag 22. Dezember",
              style: TextStyle(color: Color(0xff6E6E6E), fontSize: 10)),
          preferredSize: Size.fromHeight(-15)),
    );
  }
}
